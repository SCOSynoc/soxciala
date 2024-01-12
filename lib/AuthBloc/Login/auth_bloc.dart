
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/main.dart';
import 'package:soxciala/repository/Firebase/auth_repository.dart';
import 'package:soxciala/utlis/Validation.dart';

import '../../models/Posts.dart';
import '../../models/Users.dart';
import '../../repository/Firebase/post_repository.dart';
import '../../repository/local_storage.dart';
import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(): super(AuthInitial()) {
    on<AuthLoginRequested>(_authLoginRequested);
    on<AuthLogout>(_onAuthLogoutRequested);
    on<AlreadyAuthenticatedCheck>(_onAlreadyAuthenticatedCheck);
    on<GetAllUsers>(_onUserFetchedRequested);
    on<AuthUserDataRequested>(_onAuthUserDataRequested);
    on<FollowUserRequested>(_onFollowUserRequested);
    on<RequestCurrentUserPosts>(_onRequestCurrentUsersPosts);
    on<CheckAlreadyFollowedEvent>(_onCheckFollowedRequested);
    on<UnFollowUserRequested>(_onUnFollowUserRequested);
    on<CheckAlreadyFollowerEvent>(_onCheckFollowerRequested);


  }

  LocalDataService loService = HiveService();
  AuthService authService = AuthService()..initializeInstances();
  PostService postService = PostService()..initializeInstances();


  void _authLoginRequested(AuthLoginRequested event, Emitter<AuthStates> emit) async{
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;

      if(email.isEmpty){
        return emit(AuthFailure(error: "Email should not be empty"));
      }

      if(password.length < 8) {
        return emit(AuthFailure(error: "Password is too short"));
      }

      LocalDataService loService = HiveService();
      loService.addData(key: "userData", value: email);
      log("here data added successfully $email");
      await authService.loginInUserWithEmailAndPassword(email: email, password: password).then((value) {
        return emit(AuthSuccess(userUid: email));
      }).onError((error, stackTrace) {
        emit(AuthFailure(error:error.toString()));
      });

    } catch (e) {
      return emit(AuthFailure(error:e.toString()));
    }
  }


  void _onAuthLogoutRequested(
      AuthLogout event,
      Emitter<AuthStates> emit,
      ) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        loService.removeData(key: "userData");
        loService.removeData(key: "userMap");
        authService.logoutCurrentUser();
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(error:e.toString()));
    }
  }


  void _onAlreadyAuthenticatedCheck(AlreadyAuthenticatedCheck event, Emitter<AuthStates> emit) async{
    emit(AuthLoading()) ;
    try {
        String data = loService.getData(key: "userData");
        print("here the checked data is user from local hive storage Authentication check :: () $data");
        Users? user =await  authService.getCurrentUserData();
        if(user == null) {
          emit(AuthFailure(error:"Login again"));
        }else{
          loService.addData(key: "userMap", value: jsonEncode(user.toJson()));
          return emit(AlreadyAuthenticated(userUid: data));
        }

    }catch(e) {
      emit(AuthFailure(error:e.toString()));
    }

  }

  void _onUserFetchedRequested(GetAllUsers event, Emitter<AuthStates> emit) async{
    emit(AuthLoading());
    try {
      List<Users> users = await authService.getAllUsers();
      return emit(UsersFetched(users: users));
    }catch(e) {
      emit(UsersFetchedFailure(failed: e.toString()));
    }
  }

  void _onAuthUserDataRequested(AuthUserDataRequested event, Emitter<AuthStates> emit) async{
    emit (AuthLoading());
    try {
      Users? user = await authService.getUserById(event.uid);
      print("here while getting an id its ${event.uid}");
       if(user == null) {
         emit(UsersFetchedFailure(failed: "No data found"));
       }else{
         print("onAuthUserDataRequested () succed :: ${user.toJson()}");
         emit(UsersDataFetched(users: user));
       }
    }catch(e) {
      emit(UsersFetchedFailure(failed: "No data found"));
    }


  }


  void _onFollowUserRequested(FollowUserRequested event, Emitter<AuthStates> emit){
    emit (AuthLoading());
    try{
      authService.followUser(followUserId: event.uid);
      emit(UserFollowedSuccess());
    }catch(e){
      emit(UserFollowedFailed(failed: "Something went wrong $e"));
    }
  }

  void _onUnFollowUserRequested(UnFollowUserRequested event, Emitter<AuthStates> emit){
    emit (AuthLoading());
    try{
      authService.unfollowUser(followUserId: event.uid);
      emit(UserUnFollowedSuccess());
    }catch(e){
      emit(UserUnFollowedFailed());
    }
  }


  void _onRequestCurrentUsersPosts(RequestCurrentUserPosts event, Emitter<AuthStates> emit) {
    emit(UsersPostsLoading());

    try {
      Stream<List<Posts>> posts =  postService.getCurrentUserPosts(uid: event.currentUserUid);
      emit(UserPostFetched(userPosts: posts));
    }catch(e) {
      emit(UserPostFailedToFetch(failedMessage: "Failed due to $e"));
    }
  }


  void _onCheckFollowedRequested(CheckAlreadyFollowedEvent event, Emitter<AuthStates> emit) async {
          try {
            bool isFollowing = await authService.checkIfUserAlreadyFollowed(event.followedUserId);
            emit(UserFollowedCheckSuccess(isFollowing: isFollowing ));
          }catch(e){
            throw Exception(e);
          }
  }

  void _onCheckFollowerRequested(CheckAlreadyFollowerEvent event, Emitter<AuthStates> emit) async {
    try {
      bool isFollower = await authService.checkIfUserAlreadyFollower(event.followedUserId);
      emit(UserFollowerCheckSuccess(isFollower: isFollower ));
    }catch(e){
      throw Exception(e);
    }
  }




}

