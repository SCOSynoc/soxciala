import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/screens/login_screen.dart';
import 'package:soxciala/utlis/helper.dart';


class SplashScreen extends StatelessWidget  {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Soxciala'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is AuthInitial){
            Timer(const Duration(seconds: 3),
                    ()=> navigateAndRemovePush(context, LoginPage())
            );
          }

          if(state is AlreadyAuthenticated) {
             navigateAndRemovePush(context, DashboardScreen());
          }

          if(state is AuthFailure){
            navigateAndRemovePush(context, LoginPage());
          }


        });
  }
}


