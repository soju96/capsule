import 'package:capsule/src/pages/login_screen_kl.dart';
import 'package:capsule/src/pages/sign_up_screen_kl.dart';
import 'package:capsule/src/widgets/animated_memo_wk.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedMemo(controller: _controller),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '오늘의 행복을 오랫동안',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                '일상생활에서의 행복을 남기세요.',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 70,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LogInScreen()));
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
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
