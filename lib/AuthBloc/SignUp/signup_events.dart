import 'package:flutter/cupertino.dart';

@immutable
sealed class SignupEvents {}

class SignupRequested extends SignupEvents {
  final String email;
  final String password;
  final String name;
  final String mobile;


  SignupRequested( {required this.email,required this.password,required this.name, required this.mobile, });

}

