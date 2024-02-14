import 'package:capsule/src/pages/home_screen.dart';
import 'package:capsule/src/pages/shelf_list_hj.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This trailing comma makes auto-formatting nicer for build methods.

    return MaterialApp(
      theme: ThemeData(
        // 위에 컬러
        primaryColor: const Color(0xFF6c4c1c),
        canvasColor: const Color(0xfffffcf1),
        // 백그라운드 컬러
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xfffffcf1),
        ),
        // 네비게이션 컬러
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xFF6c4c1c),
        ),

        // 앱바 글자
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontFamily: 'sehyun'),
          // font family 는 나중에 바꿀게요~
        ),
        // 총 글자
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontFamily: 'sehyun'),
        ),
      ),

      // 홈
      home: const ShelfList(),
    );
  }
}
