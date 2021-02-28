import 'package:flutter/material.dart';

class FadeAndTransitionAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const FadeAndTransitionAnimation(
      {Key key,
      this.child,
      this.duration = const Duration(milliseconds: 600),
      this.curve = Curves.ease})
      : super(key: key);

  @override
  _FadeAndTransitionAnimationState createState() =>
      _FadeAndTransitionAnimationState();
}

class _FadeAndTransitionAnimationState extends State<FadeAndTransitionAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _opacityAnimation;
  Animation<Offset> _offsetAnimation;
  Animation _curve;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _curve = CurvedAnimation(parent: _animationController, curve: widget.curve);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_curve);
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0, -0.1), end: Offset.zero).animate(_curve);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return AnimatedBuilder(
      child: widget.child,
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
            opacity: _opacityAnimation.value,
            child: SlideTransition(
              child: child,
              position: _offsetAnimation,
            ));
      },
    );
  }
}
