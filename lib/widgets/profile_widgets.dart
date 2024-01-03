import 'package:flutter/cupertino.dart';

class ProfileEnagementCounts extends StatelessWidget {

  final String count;
  final String engageTypeText;
  const ProfileEnagementCounts({
    super.key, required this.count, required this.engageTypeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(count,),
          Text(engageTypeText)
        ]),);
  }
}