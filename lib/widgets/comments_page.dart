import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_events.dart';
import 'package:soxciala/FeedsBloc/feeds_state.dart';
import 'package:soxciala/utlis/colors.dart';

import '../models/Comments.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key, required this.postId}) : super(key: key);
  final String postId;


  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  TextEditingController commentController = TextEditingController();

  bool isLoading = false;
  Stream<List<Comments>> commentsList = Stream.value([]);
  bool isLiked = false;



  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<FeedsBloc>().add(CommentsFetchRequestedOfPost(postId: widget.postId));
  }



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<FeedsBloc,FeedsState>(builder: (context,state) {

      return  Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(color: AppColors.appSecondaryColor, borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.45,
                child: StreamBuilder<List<Comments>>(
                  stream: commentsList,
                  builder: (context, snapshot) {
                    if(snapshot.data == null ) {
                      print("data inside StreamBuilder :: null check () ${snapshot.data}");
                      return Center(child: Container(child: Text("No comments yet")),);
                    }

                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.cyan,));
                    }

                    if(snapshot.data != null && snapshot.data!.isEmpty) {
                      return Center(child: Container(child: Text("No comments yet")),);
                    }
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:  snapshot.data?.length ?? 0,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final  commentData = snapshot.data ;
                          isLiked = commentData![index].likes.contains(FirebaseAuth.instance.currentUser!.uid);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(commentData[index].username ?? "",style: TextStyle(color: AppColors.appPrimaryColor, fontWeight: FontWeight.bold), ),
                                        Text(commentData[index].comment ?? "", style: TextStyle(color: AppColors.appPrimaryColor),),
                                      ],),
                                  ),
                                  Column(
                                    children: [
                                       InkWell(
                                          child: Icon( isLiked ? CupertinoIcons.heart_fill:
                                            CupertinoIcons.heart, color:isLiked? Colors.red: Colors.white, size: 18, ),
                                         onTap: () {
                                              context.read<FeedsBloc>().add(LikeCommentRequested(postUid: widget.postId,
                                                  commentUid:commentData[index].commentUid ?? ""));
                                         },
                                      ),
                                      Text(commentData[index].likes.length.toString() ?? "", style: TextStyle(color: AppColors.appPrimaryColor),),
                                    ],
                                  )
                                ],),
                            ),
                          );
                        });
                  }
                ),
              ),
              Divider(),
              ListTile(
                title: Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  child: TextFormField(
                    controller: commentController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Comment',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: AppColors.appSecondaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: AppColors.appSecondaryColor)),
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () => {
                        context.read<FeedsBloc>().add(CommentOnAddFeedRequested(
                            postId: widget.postId,
                            comment: commentController.text
                        )
                        )
                  } ,
                  child: const Text(
                    "Publish",
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }, listener:(context,state) {
       if(state is CommentLoading) {
         isLoading = true;
       }

       if(state is CommentFetchSuccess){
         commentsList = state.comments;

       }

       if(state is CommentsInitial){
         context.read<FeedsBloc>().add(CommentsFetchRequestedOfPost(postId: widget.postId));
       }




    });

  }
}
