import 'package:capsule/src/pages/Result_account_screen_kl.dart';
import 'package:flutter/material.dart';

class SearchAccountScreen extends StatelessWidget {
  const SearchAccountScreen({super.key});

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
                'ID / PW  찾기',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '이메일',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ResultAccountScreen()));
                },
                child: Text(
                  '아이디 / 비밀번호 찾기',
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
