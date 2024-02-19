import 'package:capsule/src/pages/login_screen_kl.dart';
import 'package:flutter/material.dart';

class ResultAccountScreen extends StatelessWidget {
  const ResultAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'ID / PW  찾기 결과',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                ' 님의 가입정보',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'ID : ',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                'PW : ',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                '닉네임 : ',
                style: TextStyle(fontSize: 30),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LogInScreen()));
                },
                child: Text(
                  'To Login',
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
