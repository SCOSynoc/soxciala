import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_bloc.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_events.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_states.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/utlis/helper.dart';

import '../utlis/colors.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfeild.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final nameController = TextEditingController();
  final bioController = TextEditingController();


  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context, ) {
    return BlocConsumer<SignupBloc, SignupStates>(

      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // welcome back, you've been missed!
                  Text(
                    'Registration',
                    style: TextStyle(
                      color: AppColors.textColorShade2,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // name textfield
                  CommonTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // username textfield
                  CommonTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // password textfield
                  CommonTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),
                  // mobile textfield
                  CommonTextField(
                    controller: mobileController,
                    hintText: 'Mobile',
                    obscureText: false,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 25),
                  // sign in button
                  MyButton(
                    onTap:(){

                      context.read<SignupBloc>().add(SignupRequested(
                          email: emailController.text, password: passwordController.text,
                          name: nameController.text,
                          mobile: mobileController.text
                      )
                      );

                    }, buttonText: state is SignupLoading ?'Loading....':'Sign up',
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if(state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error,),
            ),
          );
        }
        if(state is SignupSuccess) {
          navigateAndRemovePush(context, const DashboardScreen());
        }
      },

    );


  }
}