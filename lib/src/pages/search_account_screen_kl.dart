import 'dart:convert';

import 'package:capsule/src/pages/result_account_screen_kl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String springBootUrl =
    'http://10.0.2.2/happy-capsule/find'; // 여기에 Spring Boot 서버의 URL을 넣으세요.
final TextEditingController emailController = TextEditingController();

class SearchAccountScreen extends StatelessWidget {
  const SearchAccountScreen({super.key});

  Future<void> searchAccount(context, String email) async {
    try {
      final response = await http.post(
        Uri.parse('$springBootUrl/api/search_account'),
        body: jsonEncode(<String, String>{
          'u_email': email,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // 서버 응답 확인
        Map<String, dynamic> responseData = jsonDecode(response.body);
        bool success = responseData['success'];
        String message = responseData['message'];

        if (success) {
          // 계정 검색 성공
          // 계정 결과 화면으로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ResultAccountScreen()),
          );
        } else {
          // 계정검색 실패
          // 오류 메시지 표시
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // 서버 요청 실패
        // 에러 처리
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('서버 요청 실패'),
            backgroundColor: Colors.red,
          ),
        );
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
                  searchAccount(context, email);
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
