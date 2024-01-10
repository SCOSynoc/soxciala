import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

@immutable
sealed class SignupStates{}

class SignupInitial extends SignupStates {}

class SignupSuccess extends SignupStates {

}

class SignupFailure extends SignupStates  {

  final String error;
  SignupFailure({required this.error});

}

class SignupLoading extends SignupStates {}

class ImageAdded extends SignupStates {
  final File? mobileFile;
  final Uint8List? webImage;
  ImageAdded({this.mobileFile,this.webImage});

}

class ProfileUpdatedSuccess extends SignupStates {

}

class ProfileUpdatedFailure extends SignupStates {

}

class ProfileImageUpdateSuccess extends SignupStates {
  final String message;
  ProfileImageUpdateSuccess({required this.message});
}

class ProfileImageUpdateFailure extends SignupStates {}
