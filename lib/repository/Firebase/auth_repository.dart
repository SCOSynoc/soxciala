
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';

import '../../models/Users.dart' ;
import '../../screens/dashboard/DashBoardScreen.dart';
import '../../utlis/helper.dart';

abstract class AuthRepository {

    void initializeInstances();

    Future<void> signInUserWithEmailAndPassword({ required String email ,
      required String password,
      required String mobile,
      required String name});

    Future<void> loginInUserWithEmailAndPassword({
      required String email ,
      required String password,
    });

    Future<Users?> getCurrentUserData();

}



class AuthService extends AuthRepository {

  late FirebaseAuth auth;
  late FirebaseFirestore firestore;

  @override
  void initializeInstances() {
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;

  }

  @override
  Future<Users?> getCurrentUserData() async {
    Users? user;
    if(auth.currentUser == null){
      return user;
    }else{
      var userData = await firestore.collection("s_user").doc(auth.currentUser!.uid).get();


      if(userData.data() != null){
        /*var fDocument =  await firestore.collection("s_user").doc(auth.currentUser!.uid).collection("followers").get();
        var folDocument =  await firestore.collection("s_user").doc(auth.currentUser!.uid).collection("followings").get();
        print("In get current user data() :: auth id is ${auth.currentUser!.uid}");
        Helper.followers.value = fDocument.docs.length;
        Helper.following.value = folDocument.docs.length;*/
        user = Users.fromJson(userData.data()!);
      }
      return user;
    }
  }

  @override
  Future<void> loginInUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw Exception(e.message);
    } on Exception catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signInUserWithEmailAndPassword({required String email,
    required String password,  required String mobile, required String name}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw Exception(e.message);
    } on Exception catch(e) {
      throw Exception(e);
    }
  }




  Future<void> saveUserToFirestore({
    required String email,
    required String password,
    required String mobile,
    required String name}) async{
    try{
      String uid = auth.currentUser!.uid;

      Users user = Users(
         userEmail: email,
         userName: name,
         userMobile: mobile,
         userUid: uid,
        userPost: [],
        userIpAddress: "",

      );
      await firestore.collection("s_user").doc(uid).set(user.toJson());
    } on FirebaseException catch(e){
      throw AuthFailure(error: e.message.toString());
    }

  }

  void logoutCurrentUser(){
    auth.signOut();
  }


  Future<List<Users>> getAllUsers() async {
    List<Users> usersList = [];
     var allUsers = await firestore.collection("s_user").get();

     for(var docs in allUsers.docs) {
       usersList.add(Users.fromJson(docs.data()));
     }
   return usersList;
  }

  Future<Users?> getUserById(String uid) async {
    Users? user;
    var userData = await firestore.collection("s_user").doc(uid).get();
      var fDocument =  await firestore.collection("s_user").doc(uid).collection("followers").get();
    var folDocument =  await firestore.collection("s_user").doc(uid).collection("followings").get();
       Helper.followers.value = fDocument.docs.length;
       Helper.following.value = folDocument.docs.length;
      if(userData.data() != null){
        user = Users.fromJson(userData.data()!);
      }
      return user;
  }


  void followUser({required String followUserId}) async {
    var userData =  await firestore.collection("s_user").doc(followUserId).get();
    var currentUserData =  await firestore.collection("s_user").doc(auth.currentUser!.uid).get();

    Users followUser = Users.fromJson(userData.data()!);
    Users currentUser = Users.fromJson(currentUserData.data()!);
    firestore.collection("s_user").doc(auth.currentUser!.uid).collection("followings").add(followUser.toJson());
    firestore.collection("s_user").doc(followUserId).collection("followers").add(currentUser.toJson());

  }







}

