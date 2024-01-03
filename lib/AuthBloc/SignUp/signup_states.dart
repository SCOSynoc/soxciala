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