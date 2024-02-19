import 'package:capsule/src/pages/guide_wk.dart';
import 'package:capsule/src/pages/index_screen_wk.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  Widget initialScreen =
      isFirstTime ? const Guide(isMyPaged: false) : const IndexScreen();
  runApp(MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;
  const MyApp({
    super.key,
    required this.initialScreen,
  });

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
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'sehyun',
          ),
          // font family 는 나중에 바꿀게요~
        ),
        // 총 글자
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'sehyun',
          ),
        ),
      ),

      // 홈

      home: initialScreen,
    );
  }
}
