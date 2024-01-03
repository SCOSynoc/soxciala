import 'package:flutter/cupertino.dart';

import '../utlis/colors.dart';



class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: AppColors.textColorShade2),);
  }
}
