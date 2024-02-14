import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '테스트',
          style: TextStyle(fontFamily: 'seoyoon'),
        ),
      ),
      body: Image.asset('assets/images/bottle.png'),
    );
  }
}
