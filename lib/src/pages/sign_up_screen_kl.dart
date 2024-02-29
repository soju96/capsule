import 'dart:convert';

import 'package:capsule/src/pages/login_screen_kl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // 컨트롤러를 생성하여 입력값을 추출합니다.
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final emailController = TextEditingController();
  final nicknameController = TextEditingController();

  Future<void> signUpRequest(
      context, String id, String pw, String email, String nickname) async {
    var apiUrl = Uri.parse(
        'http://10.0.2.2/happy-capsule/join'); // 실제 API 엔드포인트로 대체해야 합니다.

    try {
      var response = await http.post(
        apiUrl,
        body: {
          'u_id': id,
          'u_pw': pw,
          'u_email': email,
          'nickname': nickname,
        },
      );

      if (response.statusCode == 200) {
        // 서버 응답 확인
        Map<String, dynamic> responseData = jsonDecode(response.body);
        bool success = responseData['success'];
        String message = responseData['message'];

        if (success) {
          // 회원가입 성공
          // 로그인 화면으로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LogInScreen()),
          );
        } else {
          // 회원가입 실패
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
      print('회원가입 과정에서 오류 발생: $e');
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
                '회원가입',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: idController, // 아이디 입력값을 추출하기 위한 컨트롤러
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '아이디',
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
              TextFormField(
                controller: pwController, // 비밀번호 입력값을 추출하기 위한 컨트롤러
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '비밀번호',
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
              TextFormField(
                controller: emailController, // 이메일 입력값을 추출하기 위한 컨트롤러
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
              TextFormField(
                controller: nicknameController, // 닉네임 입력값을 추출하기 위한 컨트롤러
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '닉네임',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // 'Sign Up' 버튼이 눌렸을 때 회원가입 요청 보내기
                  // 입력값을 추출하여 signUpRequest() 함수에 전달
                  signUpRequest(
                    context,
                    idController.text,
                    pwController.text,
                    emailController.text,
                    nicknameController.text,
                  ); // 회원가입 요청을 보내는 함수 호출
                },
                child: Text(
                  'Sign Up',
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
