import 'dart:convert';

import 'package:capsule/src/pages/login_screen_kl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultAccountScreen extends StatefulWidget {
  const ResultAccountScreen({Key? key}) : super(key: key);

  @override
  ResultAccountScreenState createState() => ResultAccountScreenState();
}

class ResultAccountScreenState extends State<ResultAccountScreen> {
  String? email;
  String? id;
  String? password;
  String? nickname;

  // API 요청 함수
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2/happy-capsule/find'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        email = data['u_email'];
        id = data['u_id'];
        password = data['u_pw'];
        nickname = data['nickname'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // 위젯이 생성될 때 데이터를 불러옵니다.
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
                'ID / PW  찾기 결과',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                '$email 님의 가입정보',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'ID : $id',
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                'PW : $password',
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                '닉네임 : $nickname',
                style: const TextStyle(fontSize: 30),
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
