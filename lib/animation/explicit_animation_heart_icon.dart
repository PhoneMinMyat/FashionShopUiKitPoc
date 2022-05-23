import 'package:flutter/material.dart';

const kDurationForButton = Duration(milliseconds: 500);

class ExplicitAnimationHeartIcon extends StatefulWidget {
  const ExplicitAnimationHeartIcon({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationHeartIcon> createState() =>
      _ExplicitAnimationHeartIconState();
}

class _ExplicitAnimationHeartIconState extends State<ExplicitAnimationHeartIcon>
    with TickerProviderStateMixin {
  bool isAnimationComplete = false;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: kDurationForButton);

    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(_animationController.view);

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
        turns: _animationController.view,
        child: IconButton(
            onPressed: () {
              (isAnimationComplete)
                  ? _animationController.reverse()
                  : _animationController.forward();
            },
            color: _colorAnimation.value,
            icon: const Icon(Icons.favorite)),
      ),
    );
  }
}
