import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_events.dart';
import 'package:soxciala/FeedsBloc/feeds_state.dart';
import 'package:soxciala/widgets/bottom_sheet.dart';


class FeedsCard extends StatefulWidget {
  const FeedsCard({Key? key, required this.userImage,
    required this.userName, required this.caption,
    required this.feedsImage, required this.feedsUid, required this.isLiked, required this.likes}) : super(key: key);
  final String userImage;
  final String userName;
  final String caption;
  final String feedsImage;
  final String feedsUid;
  final bool isLiked;
  final List<String> likes;

  @override
  State<FeedsCard> createState() => _FeedsCardState();
}

class _FeedsCardState extends State<FeedsCard> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedsBloc, FeedsState>(
        listener: (context, state) {
          if(state is LikeSuccess) {

          }
        },
        builder: (context, snapshot) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(widget.userImage),
                  ),
                  title: Text(widget.userName),
                ),
                Image.network(widget.feedsImage, fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.45,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.caption),
                ),
                ButtonBar(
                  buttonTextTheme: ButtonTextTheme.primary,
                  buttonPadding: EdgeInsets.zero,
                  layoutBehavior: ButtonBarLayoutBehavior.constrained,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          icon: widget.isLiked ?const Icon(Icons.favorite_outlined,color: Colors.red,) : const Icon(Icons.favorite_border, ),
                          onPressed: () {
                            context.read<FeedsBloc>().add(LikeFeedsRequested(postUid: widget.feedsUid));
                          },
                        ),
                         Text("${widget.likes.length}")
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () {
                            context.read<FeedsBloc>().add(CommentInitial());
                            showBottomCommentPanel(context: context, currentPostUid: widget.feedsUid, );
                          },
                        ),
                        Text("")
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}



