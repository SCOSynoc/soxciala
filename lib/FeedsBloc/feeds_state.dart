import 'package:flutter/cupertino.dart';
import 'package:soxciala/models/Comments.dart';

import '../models/Posts.dart';

@immutable
sealed class FeedsState {}

/// fetch feeds
class FeedsInitial extends FeedsState {}

class FeedsFetchFailure extends FeedsState{
  final String error;

  FeedsFetchFailure({required this.error});
}

class FeedsFetchSuccess extends FeedsState {
  final Stream<List<Posts>> dataMap;
  final String uid;

  FeedsFetchSuccess( {required this.dataMap,required this.uid,});
}

class FeedsLoading extends FeedsState{}

class FeedsLimitExceeded extends FeedsState {}


class FeedsAddedSuccessfully extends FeedsState {

  final String message;
  FeedsAddedSuccessfully({required this.message});

}

class FeedsAddedFailure extends FeedsState {

  final String error;
  FeedsAddedFailure({required this.error});

}

class LikeSuccess extends FeedsState {
  final bool liked;
  LikeSuccess({required this.liked});

}

class LikeFailed extends FeedsState {
  final String msg;
  LikeFailed({required this.msg});

}


/// comments states

class CommentLoading extends FeedsState {}

class CommentAddedSuccessfully extends FeedsState {
  final String msg;
  CommentAddedSuccessfully({required this.msg});
}

class CommentAddFailure extends FeedsState {
  final String msg;
  CommentAddFailure({required this.msg});
}

class CommentFetchSuccess extends FeedsState {
  final Stream<List<Comments>> comments;
  CommentFetchSuccess({required this.comments});
}


class CommentFetchFailure extends FeedsState {
  final String msg;
  CommentFetchFailure({required this.msg});
}

class CommentsInitial extends FeedsState {}

class LikeCommentSuccess extends FeedsState {
  final bool liked;
  LikeCommentSuccess({required this.liked});
}

class LikeCommentFailed extends FeedsState {
  final String msg;
  LikeCommentFailed({required this.msg});
}

