import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_events.dart';

import '../../FeedsBloc/feeds_state.dart';
import '../../widgets/FeedsCard.dart';
import '../../widgets/VerticalScrollPostView.dart';


class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {

  FeedsFetchSuccess? successState ;

  @override
  void initState() {
    super.initState();
    // context.read<FeedsBloc>().add(FetchFeedsRequested());
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedsBloc,FeedsState>(
      builder: (context, state) {
        if(state is FeedsLoading) {
          return const Center(child: CircularProgressIndicator(color: Colors.black,));
        }

        if(state is FeedsFetchFailure) {
          return  Center(child: Text("Here the error is ${state.error}"));
        }

        if(state is FeedsFetchSuccess) {
          successState = state;
        }

        return Scaffold(
            appBar: AppBar(
              title: Text('Feeds'),
            ),
            body: Container(
              child: VerticalScrollPostView(state: successState,),
            )
        );;

      }, listener: (BuildContext context, Object? state) {
      if(state is FeedsFetchSuccess){

      }
    },
    );
  }
}




