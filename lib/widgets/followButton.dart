import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utlis/colors.dart';


class FollowButton extends StatelessWidget {
  const FollowButton({super.key, this.onPressed, this.color, required this.text, required this.width, required this.height});
  final Function()? onPressed;
  final Color? color;
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color:color ?? Colors.black,
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: AppColors.appPrimaryColor),),
        ))
    ;
  }
}