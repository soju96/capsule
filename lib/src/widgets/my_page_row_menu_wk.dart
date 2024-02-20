import 'package:flutter/material.dart';

class MyPageRowMenu extends StatelessWidget {
  final String name;
  final Widget action;

  const MyPageRowMenu({
    super.key,
    required this.name,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 18, height: 2.5),
        ),
        action
      ],
    );
  }
}
