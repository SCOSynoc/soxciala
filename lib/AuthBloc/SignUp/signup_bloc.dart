


import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soxciala/AuthBloc/Login/auth_event.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_events.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_states.dart';
import 'package:soxciala/repository/Firebase/auth_repository.dart';

class SignupBloc extends Bloc<SignupEvents, SignupStates> {

  SignupBloc() : super(SignupInitial()) {
     on<SignupRequested>(_signupRequested);
     on<ImageInsertRequested>(_uploadImageRequested);
     on<ProfileUpdateRequested>(_onProfileUpdateRequested);
     on<ProfileImageUpdateRequested>(_onProfileImageUpdateRequested);
  }

  AuthService service = AuthService()..initializeInstances();


  void _signupRequested(SignupRequested event, Emitter<SignupStates> emit) async{
    emit(SignupLoading());
    try {
      final email = event.email;
      final password = event.password;
      final name = event.name;
      final mobile = event.mobile;

      if(email.isEmpty){
       return emit(SignupFailure(error: "Email should not be empty")) ;
      }

      if(password.length < 8) {
        emit(SignupFailure(error: "Password is too short"));
      }
        await service.signInUserWithEmailAndPassword(email: email, password: password, mobile: mobile, name: name).then((value) async {
          await service.saveUserToFirestore(email: email, password: password, mobile: mobile, name: name,
              web: event.web, mobileImage: event.mobileImage).then((value){
            emit(SignupSuccess());
          });
        });

    } catch (e) {
      print("Error in signUpBloc() :: singupRequested function :: $e");
      return emit(SignupFailure(error:e.toString()));
    }
  }

  void _uploadImageRequested(ImageInsertRequested event, Emitter<SignupStates> emit) async{
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await  _picker.pickImage(source: ImageSource.gallery);
      if(image != null) {
        if(kIsWeb){
          Uint8List f = await image.readAsBytes();
          emit(ImageAdded(webImage: f));
        }else{
          File mobileSelected = File(image.path);
          emit(ImageAdded(mobileFile: mobileSelected));
        }
      }
    }catch(e) {
      emit(ImageAddedFailure());
    }

  }


  void _onProfileUpdateRequested(ProfileUpdateRequested event, Emitter<SignupStates> emit)async {
       try{
         service.updateUserProfile(users: event.users, name: event.name, email: event.email, mobileNum: event.mobile);
         emit(ProfileUpdatedSuccess());
       }catch(e){
         emit(ProfileUpdatedFailure());
       }
  }

  void _onProfileImageUpdateRequested(ProfileImageUpdateRequested event, Emitter<SignupStates> emit){

    try{
       service.updateUserProfileImage(users: event.user, mobileImage: event.mobileImage, webImage: event.webImage);
       emit(ProfileImageUpdateSuccess(message: "Image updated successfully"));
    }catch(e){
        emit(ProfileImageUpdateFailure());
    }

  }



}