

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soxciala/utlis/helper.dart';
import 'package:soxciala/widgets/LazyLoad.dart';
import 'package:soxciala/widgets/appear_aniamtion_widget.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../FeedsBloc/feeds_state.dart';
import '../models/Posts.dart';
import 'FeedsCard.dart';
class VerticalScrollPostView extends StatefulWidget {
  final FeedsFetchSuccess? state;
  const VerticalScrollPostView({Key? key, required this.state}) : super(key: key);

  @override
  State<VerticalScrollPostView> createState() => _VerticalScrollPostViewState();
}

class _VerticalScrollPostViewState extends State<VerticalScrollPostView> {
  final ScrollController _controller = ScrollController();
  bool _isLoading = false;
   List<dynamic> _dummy = [];
  List<dynamic> _items = [];
   int dataCount = 2;
   int count = 0;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<List<Posts>>(
      stream: widget.state?.dataMap ?? Stream.value([]),
      builder: (context, snapshot) {
        if(snapshot.data == null) {
          return const Center(child: Text("No data present"),);
        }
        return ListView.builder(
              shrinkWrap: true,
              controller: _controller,
              itemCount: snapshot.data!.length, // Change this to the number of posts you want to display
              itemBuilder: (context, index) {
                List<Posts> data = snapshot.data!;
                return  AnimatedAppearWidget(
                  child: FeedsCard(
                      userImage: data[index].userImage ,
                      userName: "${data[index].userName}",
                      caption: "${data[index].postCaptions}",
                      feedsImage: "${data[index].postImage}", feedsUid: data[index].postUid,
                      isLiked: data[index].likes
                          .contains(FirebaseAuth.instance.currentUser!.uid), likes: data[index].likes,),
                );
              },
            );
      }
    );

  }
}

