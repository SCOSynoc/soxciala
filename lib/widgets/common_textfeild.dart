import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utlis/colors.dart';


class CommonTextField extends StatelessWidget {
  const CommonTextField({Key? key,
    required this.controller,
    required this.hintText,

    required this.obscureText, this.textInputType, this.maxLength, this.onChanged}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? textInputType;
  final int? maxLength;
  final Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        maxLength: maxLength,
        onChanged: onChanged,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            fillColor: AppColors.fillColor,
            filled: true,
            counterText: "",
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.hintTextColor)),
      ),
    );
  }
}
