

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_event.dart';

import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/screens/signup_screen.dart';

import '../AuthBloc/Login/auth_bloc.dart';
import '../utlis/colors.dart';
import '../utlis/helper.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfeild.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {

  }

  @override
  Widget build(BuildContext context,) {
    return BlocConsumer<AuthBloc, AuthStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  // welcome back, you've been missed!
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: AppColors.textColorShade2,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // username textfield
                  CommonTextField(
                    controller: usernameController,
                    hintText: 'Username',
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

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: AppColors.textColorShade1),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button

                  MyButton(
                    onTap: state is AuthLoading ? null :() {
                        context.read<AuthBloc>().add(AuthLoginRequested(email: usernameController.text, password: passwordController.text));

                    }, buttonText:state is AuthLoading ? "Loading...." :'login',
                  ),

                  const SizedBox(height: 50),
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: AppColors.textColorShade2),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: (){
                          navigateToScreen(context, SignUpPage());
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
            if(state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error,),
                ),
              );
            }

            if(state is AuthSuccess) {
              navigateAndRemovePush(context, const DashboardScreen());
            }
      },

    );
  }
}

