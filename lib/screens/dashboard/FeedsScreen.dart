import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
            body: Center(
              child: Container(
                child: VerticalScrollPostView(state: successState,),
              ),
            )
        );

      }, listener: (BuildContext context, Object? state) {
      if(state is FeedsFetchSuccess){

      }
    },
    );
  }
}


class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: const Offset(0.8, 10.0),
          child: child,
        );
      },
    );
  }
}




