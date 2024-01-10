
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:soxciala/models/Comments.dart';
import 'package:soxciala/models/Posts.dart';
import 'package:soxciala/repository/Firebase/auth_repository.dart';
import 'package:uuid/uuid.dart';

import '../../models/Users.dart';

abstract class PostRepository {

  void initializeInstances();

  void createPostOfUser({required String postUid,
    required String postCaptions,
    File? postMobileImage,
    List<Users>? postsTags,
    required String postTime,
    Uint8List? webImage,
    required String username,
    required String userImage,
    String? postIpAddress,});


  Stream<List<Posts>> getAllPosts();

  Stream<List<Posts>> getCurrentUserPosts({ required String uid});

  void likePosts(String postId);

  void addCommentsToPost({
  required String comment,
  required String postId});

  Stream<List<Comments>> getAllCommentsListByPost(String postId);

}

class PostService extends PostRepository {

  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  late AuthService authService;


  @override
  void createPostOfUser({
    required String postUid,
    Uint8List? webImage,
    required String postCaptions,
    File? postMobileImage,
    List<Users>? postsTags,
    required String postTime,
    required String username,
    required String userImage,
    String? postIpAddress}) async{
    
    try {
      String uid = auth.currentUser!.uid;
      final _uuid = const Uuid().v1();
      String imageUri = "";
      Reference ref = FirebaseStorage.instance.ref().child("postsImages").child("$_uuid.jpg");
      if(webImage != null){
         await ref.putData(webImage);
        imageUri = await ref.getDownloadURL();
      }

      if(postMobileImage != null) {
        await ref.putFile(postMobileImage);
        imageUri = await ref.getDownloadURL();
      }

      Posts posts = Posts(postUid: postUid, postedBy: uid,
          postCaptions: postCaptions, postImage: imageUri, postsTags: postsTags ??  [],
          postTime: postTime, postIpAddress: postIpAddress, likes: [], userName: username, userImage: userImage);
      await firestore.collection("s_posts").doc(postUid).set(posts.toJson());
    } catch(e) {
      throw Exception(e);
    }

  }

  @override
  Stream<List<Posts>> getAllPosts() {
      return firestore.collection("s_posts")
          .snapshots().map((event) {
         List<Posts> postsList = [];
         for(var document in event.docs){
           postsList.add(Posts.fromJson(document.data()));
         }
         print("In get all posts function() :: $postsList" );
         return postsList;
      });
  }

  @override
  void initializeInstances() {
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    authService = AuthService()..initializeInstances();
  }

  @override
  Stream<List<Posts>> getCurrentUserPosts({ required String uid}) {
    return firestore.collection("s_posts")
        .where("postedBy",isEqualTo: uid)
        .snapshots()
        .map((event) {
      List<Posts> postsList = [];
      for(var document in event.docs){
        postsList.add(Posts.fromJson(document.data()));
      }
      print("In getCurrentUserPosts() :: $postsList" );
      return postsList;
    });
  }

  @override
  Future<bool> likePosts(String postId) async {
         String currentUserUid = auth.currentUser!.uid;
         DocumentSnapshot doc = await firestore.collection("s_posts").doc(postId).get();
         if(doc.get("likes").contains(currentUserUid)) {
           firestore.collection("s_posts").doc(postId).update({"likes": FieldValue.arrayRemove([currentUserUid])});
           return false;
         }else{
           firestore.collection("s_posts").doc(postId).update({"likes": FieldValue.arrayUnion([currentUserUid])});
           return true;
         }
  }

  @override
  void addCommentsToPost({
    required String comment,
    required String postId}) async{

    var commentUid = const Uuid().v4();
       try {
         final userId = auth.currentUser!.uid;
         final commentTime = DateTime.now();
         Users? commentUser = await authService.getCurrentUserData();
         Comments comments = Comments(username: commentUser?.userName ?? "",
             userId: userId, commentUid: commentUid, comment: comment, likes: [], commentTime: commentTime);
         await firestore.collection("s_posts").doc(postId).collection("comments").doc(commentUid).set(comments.toJson());
       }catch(e) {
         throw Exception(e);
       }
  }

  @override
  Stream<List<Comments>> getAllCommentsListByPost(String postId) {
      return firestore.collection("s_posts").doc(postId)
          .collection("comments")
          .orderBy("commentTime").snapshots().map((event) {
            List<Comments> comList = [];
            for(var document in event.docs){
              comList.add(Comments.fromJson(document.data()));
            }

            return comList;
      });
  }

  Future<bool> likeComments(String postId, String commentUid) async{
    String currentUserID = auth.currentUser!.uid;
    DocumentSnapshot doc = await firestore.collection("s_posts").doc(postId)
                                          .collection("comments").doc(commentUid).get();
    if(doc.get("likes").contains(currentUserID)) {
      firestore.collection("s_posts").doc(postId)
          .collection("comments").doc(commentUid).update({"likes": FieldValue.arrayRemove([currentUserID])});
      return false;
    }else{
      firestore.collection("s_posts").doc(postId)
          .collection("comments").doc(commentUid).update({"likes": FieldValue.arrayUnion([currentUserID])});
      return true;
    }
  }



}