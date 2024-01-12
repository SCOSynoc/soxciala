import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soxciala/AuthBloc/Login/auth_bloc.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_bloc.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_events.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_states.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/utlis/helper.dart';

import '../models/Users.dart';
import '../utlis/colors.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfeild.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key, this.users});
  final Users? users;

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final nameController = TextEditingController();
  final bioController = TextEditingController();
   File? postMobileImage;
   Uint8List? fileBytesWeb;

   bool isLoading = false;
   bool updatePhoto = false;



  @override
  Widget build(BuildContext context, ) {
    return BlocConsumer<SignupBloc, SignupStates>(

      builder: (BuildContext context, state) {
        nameController.text = users?.userName ?? "";
        emailController.text = users?.userEmail ?? "";
        bioController.text = "";
        mobileController.text = users?.userMobile ?? "";
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: true,
             title: Text( users == null ? "Sign up" : "Update profile"),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  Text(
                    users == null ?'Registration' : 'Update profile',
                    style: TextStyle(
                      color: AppColors.textColorShade2,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Visibility(
                    visible: users == null,
                    child: InkWell(
                      onTap: () async{
                           context.read<SignupBloc>().add(ImageInsertRequested());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            SizedBox(child:kIsWeb?  CircleAvatar(
                              radius: 70,
                              backgroundImage:fileBytesWeb == null ? null
                                  : MemoryImage(fileBytesWeb!),
                              backgroundColor: Colors.grey.shade600, )
                                : CircleAvatar(
                              radius: 70,
                              backgroundImage: postMobileImage == null ? null : FileImage(postMobileImage!),
                              backgroundColor: Colors.grey.shade600,
                            ), ),
                               Visibility(
                                 visible: kIsWeb ? fileBytesWeb == null ? true: false: postMobileImage == null ? true: false,
                                 child: const Positioned(
                                     left: 0,
                                     right: 0,
                                     top: 0,
                                     bottom: 0,
                                     child: Icon(
                                       Icons.camera_enhance_rounded, color: Colors.black, size: 40,)
                                 ),
                               )
                        ],),
                      ),
                    ),
                  ),
                  // name textfield
                  CommonTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // username textfield
                  Visibility(
                    visible: users == null ? true: false,
                    child: CommonTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // password textfield
                  Visibility(
                    visible: users == null? true: false,
                    child: CommonTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
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

                      if(users != null) {
                        context.read<SignupBloc>().add(
                            ProfileUpdateRequested(
                            email: emailController.text,
                            name: nameController.text,
                            mobile: mobileController.text, users: users!,
                        ));
                      }else{
                        context.read<SignupBloc>().add(SignupRequested(
                            email: emailController.text, password: passwordController.text,
                            name: nameController.text,
                            mobile: mobileController.text,web: fileBytesWeb,
                            mobileImage: postMobileImage
                        )
                        );
                      }

                    }, buttonText: users != null ? 'Update':'Sign up',
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

        if(state is ImageAdded) {
          fileBytesWeb = state.webImage;
          postMobileImage = state.mobileFile;
        }

        if(state is SignupLoading) {
           isLoading = true;
        }

        if(state is ProfileUpdatedSuccess) {
             navigateAndRemovePush(context, const DashboardScreen());
        }

        if(state is ProfileUpdatedFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Update failed",),
            ),
          );
        }

      },

    );


  }
}