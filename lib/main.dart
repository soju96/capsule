import 'package:capsule/firebase_options.dart';
import 'package:capsule/src/pages/guide_wk.dart';
import 'package:capsule/src/pages/index_screen_wk.dart';
import 'package:capsule/src/pages/login_screen_kl.dart';
import 'package:capsule/src/pages/shelf_list_hj.dart';
import 'package:capsule/src/services/firebase_service.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseService().initialize();

  // 앱 최초 실행인지 여부 저장 (가이드 스크린 or 홈)
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  Widget initialScreen =

      isFirstTime ? const IndexScreen() : const Guide(isMyPaged: false);

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
