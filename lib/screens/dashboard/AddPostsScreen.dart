


import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soxciala/FeedsBloc/feed_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_events.dart';
import 'package:soxciala/FeedsBloc/feeds_state.dart';
import 'package:soxciala/repository/local_storage.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/utlis/helper.dart';
import 'package:soxciala/widgets/common_button.dart';


import '../../utlis/colors.dart';
import '../../widgets/common_dropdown.dart';
import '../../widgets/common_textfeild.dart';
import '../../widgets/custom_text.dart';




class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController captionController = TextEditingController();
  File ? postMobileImage;
  Uint8List? fileBytesWeb;
  String? fileName;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedsBloc, FeedsState>(
      listener: (context, state) {
          if(state is FeedsAddedFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error,),
              ),
            );
          }

          if(state is FeedsAddedSuccessfully) {
            navigateAndRemovePush(context, DashboardScreen());
          }
      },
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add post"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(text: "Add Image for post"),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async{

                        final ImagePicker _picker = ImagePicker();
                        XFile? image = await  _picker.pickImage(source: ImageSource.gallery);
                        if(image != null) {
                          if(kIsWeb){
                            Uint8List f = await image.readAsBytes();
                            setState(() {
                              fileBytesWeb = f;

                            });

                            /*HiveService service = HiveService();
                            service.addPhotoWithMultipartRequest(fileBytesWeb);*/
                          }else{
                            File mobileSelected = File(image.path);
                            postMobileImage = mobileSelected;
                          }

                        }


                      },
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.appPrimaryColor),
                        width: 300,
                        height: 400,
                        child: kIsWeb ? Center(
                          child: fileBytesWeb == null ?
                          Icon(CupertinoIcons.camera) : Image.memory(fileBytesWeb!, fit: BoxFit.fill,) ,
                        ) : Center(
                          child: postMobileImage == null ?
                          const Icon(CupertinoIcons.camera) : Image.file(postMobileImage!, fit: BoxFit.cover,) ,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(text: "Add Caption for post"),
                  ),
                  CommonTextField(controller: captionController, hintText: 'Add Caption here', obscureText: false,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(text: "Tag your friend"),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const MultiSelectDropdown()),
                  MyButton(onTap: (){
                    context.read<FeedsBloc>().add(AddFeedsEvent(
                        image: postMobileImage, captions: captionController.text, tags: '', webImage: fileBytesWeb));
                  }, buttonText: "create posts")
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

