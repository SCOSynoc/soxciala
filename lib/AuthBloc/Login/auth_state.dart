import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:soxciala/models/Posts.dart';
import 'package:soxciala/repository/local_storage.dart';

import '../../models/Users.dart';

@immutable
sealed class AuthStates{}

class AuthInitial extends AuthStates {}

class AuthSuccess extends AuthStates {
final String userUid;

AuthSuccess({required this.userUid});

}

class AuthFailure extends AuthStates  {

  final String error;
  AuthFailure({required this.error});

}

class AuthLoading extends AuthStates {}

class AlreadyAuthenticated extends AuthStates {
  final String userUid;
  AlreadyAuthenticated({required this.userUid});
}

class UsersFetched extends AuthStates {
  final List<Users> users;
  UsersFetched({required this.users});
}

class UsersDataFetched extends AuthStates {
  final Users users;
  UsersDataFetched({required this.users});
}

class UsersFetchedFailure extends AuthStates {
  final String failed;
  UsersFetchedFailure({required this.failed});
}

class UserFollowedSuccess extends AuthStates {}

class UserFollowedFailed extends AuthStates {
  final String failed;
  UserFollowedFailed({required this.failed});
}

class UserUnFollowedSuccess extends AuthStates {}

class UserUnFollowedFailed extends AuthStates {}


class UsersPostsLoading extends AuthStates {}

class UserPostFetched extends AuthStates {

  final Stream<List<Posts>> userPosts;
  UserPostFetched({required this.userPosts});

}

class UserPostFailedToFetch extends AuthStates {

  final String failedMessage;
  UserPostFailedToFetch({required this.failedMessage});

}


class UserFollowedCheckSuccess extends AuthStates {
  final bool isFollowing;
  UserFollowedCheckSuccess({required this.isFollowing});
}




