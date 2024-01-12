import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soxciala/AuthBloc/Login/auth_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/screens/login_screen.dart';


import '../models/Users.dart';


void navigateToScreen(BuildContext context, Widget screen, {bool replace = false}) {
  if (replace) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}

void navigateAndRemovePush(BuildContext context, Widget screen,){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
          (Route<dynamic> route) => false
  );
}

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}





/*
below code is for filter
const resolvers = {
Query: {
album (parent, args, context, info) {
const { ids } = args;
return context.db.Albums.filter((a) => ids.includes(a.id))
}
}
} */


Map<String, dynamic> getUserDataMap({required String name, 
required String userId, required String email, required String mobile, required String profilePic, required List<String> followers, 
required List<String> followings, required String createdAt }){
   return {
    "userId": userId,
      "name": name,
      "email": email,
      "mobile": mobile,
      "profilePic": profilePic,
      "followers": followers,
      "following": followings,
      "createdAt": createdAt,
   };
}


class Helper {

  static FirebaseAuth auth = FirebaseAuth.instance;
  static ValueNotifier<List<Users>> searchList = ValueNotifier<List<Users>>([]);
  static ValueNotifier<int?> followers = ValueNotifier<int?>(null);
  static ValueNotifier<int?> following = ValueNotifier<int?>(null);

 static Widget sessionCheck( AuthStates state){
    if(state is AlreadyAuthenticated) {
      return const DashboardScreen();
    }

    if(state is AuthSuccess) {
      return const DashboardScreen();
    }

    if(state is AuthFailure) {
      return LoginPage();
    }

    return LoginPage();
  }

  static String followButtonText({required bool alreadyFollowing, required bool alreadyFollower}){
      if(alreadyFollowing == true && alreadyFollower == true) {
        return "Unfollow";
      }else if(alreadyFollower == true && alreadyFollowing == false) {
        return "Follow Back";
      } else if (alreadyFollower == false && alreadyFollowing == true){
        return "Unfollow";
      }else{
        return "Follow";
      }
  }

  static bool followOrUnFollowFunction({required bool alreadyFollowing, required bool alreadyFollower}){
    if(alreadyFollowing == true && alreadyFollower == true) {
      /// if true then call follow user function
      return false;
    }else if(alreadyFollower == true && alreadyFollowing == false) {
      /// if true then call follow user function
      return true;
    } else if (alreadyFollower == false && alreadyFollowing == true){
      /// if false the call unfollow function
      return false;
    }else{
      /// if true then call follow user function
      return true;
    }
  }



}


//solution(str) => str.split('').reversed.join('');

