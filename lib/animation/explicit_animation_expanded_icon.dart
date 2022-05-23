import 'package:flutter/material.dart';

const kDurationForButton = Duration(milliseconds: 500);

class ExplicitAnimationExpandedIcon extends StatefulWidget {
  final Function onTap;
  const ExplicitAnimationExpandedIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ExplicitAnimationExpandedIcon> createState() =>
      _ExplicitAnimationExpandedIconState();
}

class _ExplicitAnimationExpandedIconState
    extends State<ExplicitAnimationExpandedIcon> with TickerProviderStateMixin {
  bool isAnimationComplete = false;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: kDurationForButton);

    _rotateAnimation =
        Tween<double>(begin: 0, end: 0.5).animate(_animationController.view);

    _animationController.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController.view,
      builder: (context, child) => RotationTransition(
        turns: _rotateAnimation,
        child: IconButton(
            onPressed: () {
              (isAnimationComplete)
                  ? _animationController.reverse()
                  : _animationController.forward();
              widget.onTap();
            },
            icon: const Icon(Icons.keyboard_arrow_up)),
      ),
    );
  }
}
