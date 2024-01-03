import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Posts.dart';
import 'comments_page.dart';

showBottomCommentPanel({required BuildContext context, required String currentPostUid}){
  showModalBottomSheet(context: context, builder: (context) {
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Container(
        height: MediaQuery.of(context).size.height*0.65,
        child: CommentsPage(postId: currentPostUid,),
      );
    }
    );
  });
}
