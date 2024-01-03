import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soxciala/widgets/custom_text.dart';





abstract class Validate {
  void commonFunction(BuildContext context );
  factory Validate( String name, String email , String password, String mobile,) {
    if(name.length > 2 || name.isEmpty ){
      return NotifyInfoBar("Please enter name");
    }
    if(email.isEmpty ){
      return NotifyInfoBar("Email should not be empty");
    }

    if(password.length > 8 || password.isEmpty ){
      return NotifyInfoBar("Please enter role");
    }
    if( mobile.length < 10 || mobile.isEmpty){
      return NotifyInfoBar("Please enter today's date");
    }
    return ValidationSuccess();
  }
}


class NotifyInfoBar implements Validate {
  final String content;

  NotifyInfoBar(this.content);
  @override
  void commonFunction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomText(text: content,),
      ),
    );
    throw Exception(content);
  }

}

class ValidationSuccess implements Validate {
  @override
  void commonFunction(BuildContext context) {
    // TODO: implement commonFunction
  }
}

class IdleValidated implements Validate {
  @override
  void commonFunction(BuildContext context) {

  }

}
