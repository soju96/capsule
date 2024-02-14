import 'package:capsule/src/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromRGBO(255, 252, 241, 1),
        ),
        cardColor: const Color.fromRGBO(166, 119, 78, 1),
      ),
      home: const HomeScreen(),
    );
  }
}
