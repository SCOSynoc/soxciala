import 'package:flutter/cupertino.dart';

class AnimatedAppearWidget extends StatefulWidget {
  final Widget child;

  AnimatedAppearWidget({required this.child});

  @override
  _AnimatedAppearWidgetState createState() => _AnimatedAppearWidgetState();
}

class _AnimatedAppearWidgetState extends State<AnimatedAppearWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}