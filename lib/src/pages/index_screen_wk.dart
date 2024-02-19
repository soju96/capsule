import 'package:capsule/src/pages/login_screen_kl.dart';
import 'package:capsule/src/pages/sign_up_screen_kl.dart';
import 'package:capsule/src/pages/home_wk.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/memo.png',
                width: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '오늘의 행복을 오래동안',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                '일상생활에서의 행복을 남기세요.',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LogInScreen()));
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
