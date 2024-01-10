import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../models/Users.dart';

@immutable
sealed class SignupEvents {}

class SignupRequested extends SignupEvents {
  final String email;
  final String password;
  final String name;
  final String mobile;
  final Uint8List? web;
  final File? mobileImage;


  SignupRequested( {required this.email,required this.password,required this.name, required this.mobile, this.mobileImage,this.web});

}

class ProfileUpdateRequested extends SignupEvents {
  final String email;
  final String name;
  final String mobile;
  final Users users;


  ProfileUpdateRequested({required this.email,required this.name, required this.mobile,required this.users, });
}


class ImageInsertRequested extends SignupEvents {
}

class ProfileImageUpdateRequested extends SignupEvents {
  final Uint8List? webImage;
  final File? mobileImage;
  final Users user;

  ProfileImageUpdateRequested( {this.webImage,this.mobileImage,required this.user,});
}

