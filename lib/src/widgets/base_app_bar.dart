import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
