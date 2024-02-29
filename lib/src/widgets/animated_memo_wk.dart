import 'package:flutter/material.dart';

class AnimatedMemo extends StatelessWidget {
  const AnimatedMemo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      )),
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 0.1 * 2 * 3.14,
          child: Image.asset(
            'assets/images/memo.png',
            width: 50,
          ),
        );
      },
    );
  }
}
