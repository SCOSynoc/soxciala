
import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_events.dart';
import 'package:soxciala/FeedsBloc/feeds_state.dart';
import 'package:soxciala/repository/Firebase/post_repository.dart';
import 'package:uuid/uuid.dart';

import '../models/Comments.dart';
import '../models/Posts.dart';
import '../models/Users.dart';
import '../repository/local_storage.dart';

class FeedsBloc extends Bloc<FeedsEvents, FeedsState> {
   FeedsBloc() : super(FeedsInitial()) {
      on<FetchFeedsRequested>(_fetchFeedRequested);
      on<AddFeedsEvent>(_addFeedsRequested);
      on<LikeFeedsRequested>(_likeFeedsRequested);
      on<CommentOnAddFeedRequested>(_commentAddOnFeeds);
      on<CommentsFetchRequestedOfPost>(_commentsFetchRequested);
      on<CommentInitial>(_initialComments);
      on<LikeCommentRequested>(_likeCommentRequested);
   }

   int postId = 0;
   PostService postService = PostService()..initializeInstances();
   LocalDataService loService = HiveService();

   void _fetchFeedRequested(FetchFeedsRequested event, Emitter<FeedsState> emit) async{
           emit(FeedsLoading());

           try {
             /*LocalDataService loService = HiveService()..initLocalService();
             dynamic data = await loService.getData(key: "userData");
             log("here data added successfully $data");
             List< dynamic> dataMap = jsonDecode(loService.getData(key: "postData")) ;
             log("here post data map is ${dataMap}");*/
             Stream<List<Posts>> postList = postService.getAllPosts();
             print("Here in feedRequested Function() :: ${postList.first}" );
               return emit(FeedsFetchSuccess(uid: "", dataMap: postList));
           } catch (e) {
             return emit(FeedsFetchFailure(error: "$e"));
           }
   }

   void _likeFeedsRequested(LikeFeedsRequested event, Emitter<FeedsState> emit) async{
     try {
       bool liked = await postService.likePosts(event.postUid);
       emit(LikeSuccess(liked: liked));
     }catch(e){
       emit(LikeFailed(msg: "Something went wrong"));
     }
   }

   void _addFeedsRequested(AddFeedsEvent event, Emitter<FeedsState> emit) {
     emit(FeedsLoading());
     try {
       /*LocalDataService loService = HiveService()..initLocalService();
       Map<String, dynamic> postMap = {};
       dynamic data = loService.getData(key: "postData");
       final imageUri = event.image;
       final captions = event.captions;
       if(imageUri.isEmpty && captions.isEmpty){
         return emit(FeedsAddedFailure(error: "Please enter fields"));
       }

       if(data == null) {
         var uuid = const Uuid().v1();
         postMap = {"img": imageUri, "captions": captions};
         List<dynamic> postList = [postMap];
         String encodeString = jsonEncode(postList);
         loService.addData(key: "postData", value: encodeString );
         log("here data added successfully $data");
       }else{
         List<dynamic> addedPostList = jsonDecode(data);
         var uuid = const Uuid().v1();
         log("previous postMap is $addedPostList");

         addedPostList.add({"img": imageUri, "captions": captions});
         String encodeString = jsonEncode(addedPostList);
         loService.addData(key: "postData", value: encodeString);
         log("here post data added successfully $addedPostList");
       }*/
       Users user = Users.fromJson(jsonDecode(loService.getData(key: "userMap")));

       var postUid = const Uuid().v4();
       postService.createPostOfUser(postUid: postUid,
           postCaptions: event.captions,
           webImage: event.webImage,
           postTime: DateTime.now().toIso8601String(), username: user.userName, userImage: user.userImage ?? "");
         return emit(FeedsAddedSuccessfully(message: "Post created successfully"));

     } catch (e) {
       return emit(FeedsAddedFailure(error: "$e"));
     }
   }

   void _commentAddOnFeeds(CommentOnAddFeedRequested event, Emitter<FeedsState> emit){

     final postId = event.postId;
     final comment = event.comment;

     try {
       postService.addCommentsToPost(
           comment: comment,
           postId: postId);
       emit(CommentAddedSuccessfully(msg: "Comment published"));
     }catch(e) {
       emit(CommentAddFailure(msg: "Unable to publish due to $e"));
     }

   }

    void _commentsFetchRequested(CommentsFetchRequestedOfPost event, Emitter<FeedsState> emit) {
       emit(CommentLoading());
       try {
         Stream<List<Comments>> com = postService.getAllCommentsListByPost(event.postId);
         emit(CommentFetchSuccess(comments: com));
       }catch(e){
         emit(CommentFetchFailure(msg: "Unable to load comment"));
       }
    }

    void _initialComments(CommentInitial event, Emitter<FeedsState> emit) {
       emit(CommentsInitial());
    }

    void _likeCommentRequested(LikeCommentRequested event, Emitter<FeedsState> emit)async {
           try {
             bool liked = await postService.likeComments(event.postUid, event.commentUid);
             emit(LikeCommentSuccess(liked: liked));
           }catch(e) {
             emit(LikeCommentFailed(msg: "Unable to like due to $e"));
             throw Exception(e);
           }
    }



}






