<<<<<<< HEAD
import 'package:capsule/src/pages/login_screen_kl.dart';
import 'package:capsule/src/pages/sign_up_screen_kl.dart';
=======
import 'package:capsule/src/pages/home_wk.dart';
>>>>>>> 20e9a4e8b0cfc103098977e356a7848caa9f210c
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
<<<<<<< HEAD
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LogInScreen()));
=======
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
>>>>>>> 20e9a4e8b0cfc103098977e356a7848caa9f210c
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
                      MaterialPageRoute(builder: (_) => const SignUpScreen()));
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
