
import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthEvents {}

/// login and login check
class AuthLoginRequested extends AuthEvents {
    final String email;
    final String password;

    AuthLoginRequested( {required this.email,required this.password,});

}

class AuthLogout extends AuthEvents {}

class AlreadyAuthenticatedCheck extends AuthEvents {}



/// get all users , single user, follow user

class GetAllUsers extends AuthEvents {}


class AuthUserDataRequested extends AuthEvents {
    final String uid;
    AuthUserDataRequested({required this.uid});
}

class FollowUserRequested extends AuthEvents {
    final String uid;

    FollowUserRequested({required this.uid});
}

class UnFollowUserRequested extends AuthEvents {
    final String uid;

    UnFollowUserRequested({required this.uid});
}



/// current user post events
class RequestCurrentUserPosts extends AuthEvents {
    final String currentUserUid;

    RequestCurrentUserPosts({required this.currentUserUid});
}

class CheckAlreadyFollowedEvent extends AuthEvents {

    final String currentUserUid;
    final String followedUserId;

    CheckAlreadyFollowedEvent( {required this.currentUserUid,required this.followedUserId,});


}