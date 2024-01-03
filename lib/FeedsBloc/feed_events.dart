
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

@immutable
sealed class FeedsEvents {}


/// comments
class FetchFeedsRequested extends FeedsEvents {
}

class AddFeedsEvent extends FeedsEvents {
   final File? image;
   final Uint8List? webImage;
   final String captions;
   final String tags;

   AddFeedsEvent({required this.image,required this.captions,required this.tags,required this.webImage, });
}


class LikeFeedsRequested extends FeedsEvents {
   final String postUid;
   LikeFeedsRequested({required this.postUid});
}


/// comments
class CommentOnAddFeedRequested extends FeedsEvents {
   final String postId;
   final String comment;

   CommentOnAddFeedRequested({required this.postId,required this.comment});

}

class CommentsFetchRequestedOfPost extends FeedsEvents {
   final String postId;
   CommentsFetchRequestedOfPost({required this.postId});

}

class CommentInitial extends FeedsEvents {}

class LikeCommentRequested extends FeedsEvents {
   final String postUid;
   final String commentUid;
   LikeCommentRequested( {required this.postUid,required this.commentUid,});
}

