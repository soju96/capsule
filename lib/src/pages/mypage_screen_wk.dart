import 'package:capsule/src/pages/guide_wk.dart';
import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          '마이 페이지',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const MyPageRowMenu(name: '닉네임', action: Text('닉네임')),
                const MyPageRowMenu(name: '이메일', action: Text('닉네임')),
                MyPageRowMenu(
                  name: '사용자 가이드',
                  action: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Guide(),
                          ));
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                MyPageRowMenu(
                  name: '회원탈퇴',
                  action: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            const MyPageRowMenu(
              name: '로그아웃',
              action: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPageRowMenu extends StatelessWidget {
  final String name;
  final Widget action;

  const MyPageRowMenu({
    super.key,
    required this.name,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 18),
        ),
        action
      ],
    );
  }
}
