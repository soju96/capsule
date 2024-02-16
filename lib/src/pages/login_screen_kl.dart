import 'package:capsule/src/widgets/custom_bottom_app_bar_wk.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {},
                label: const Text(
                  '로그인',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {},
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
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
