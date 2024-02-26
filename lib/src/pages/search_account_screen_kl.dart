import 'dart:convert';

import 'package:capsule/src/pages/result_account_screen_kl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String springBootUrl =
    'https://your-api-url'; // 여기에 Spring Boot 서버의 URL을 넣으세요.
final TextEditingController emailController = TextEditingController();

class SearchAccountScreen extends StatelessWidget {
  const SearchAccountScreen({super.key});

  Future<void> searchAccount(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$springBootUrl/api/search_account'),
        body: jsonEncode(<String, String>{
          'email': email,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // 요청이 성공했을 때
        // 결과를 처리하는 로직을 추가하세요.
      } else {
        // 요청이 실패했을 때
        // 실패 처리를 추가하세요.
      }
    } catch (e) {
      // 네트워크 오류 등 예외 처리
      print('Error: $e');
    }
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
                controller: emailController, // 이메일 입력란에 controller 할당
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
                  String email =
                      emailController.text; // TextFormField에서 입력된 이메일 값
                  searchAccount(email);

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
