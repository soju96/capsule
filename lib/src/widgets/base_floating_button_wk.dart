import 'package:flutter/material.dart';

class BaseFloatingButton extends StatelessWidget {
  const BaseFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(
        side: BorderSide(style: BorderStyle.solid),
      ),
      backgroundColor: Colors.white,
      onPressed: () {},
      child: Image.asset(
        'assets/images/pen.png',
        width: 30,
      ),
    );
  }
}
