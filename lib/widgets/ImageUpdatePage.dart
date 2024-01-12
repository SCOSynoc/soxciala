import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_bloc.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_events.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_states.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/utlis/helper.dart';

import '../models/Users.dart';
import 'common_button.dart';

class ImageUpdatePage extends StatelessWidget {
  ImageUpdatePage({Key? key, required this.user}) : super(key: key);
  final Users user;


  File? postMobileImage;
  Uint8List? fileBytesWeb;
  bool imageAdded = false;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SignupBloc, SignupStates>(
      listener: (context, state) {
        if(state is ImageAdded) {
          fileBytesWeb = state.webImage;
          postMobileImage = state.mobileFile;
          imageAdded = true;
        }

        if(state is ProfileImageUpdateSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message,),
            ),
          );
          navigateAndRemovePush(context, const DashboardScreen());
        }

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: const Text("Update Iamge"),
          ),
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               InkWell(
                 onTap: () {
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
               MyButton(
                 onTap:(){
                   if(imageAdded){
                     context.read<SignupBloc>().add(ProfileImageUpdateRequested(
                         user: user,
                         webImage: fileBytesWeb,
                         mobileImage: postMobileImage
                     ));
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text("Please add image ",),
                       ),
                     );
                   }

                 }, buttonText:"Update photo",
               )
             ],
           ),
        );
      }
    );
  }
}
