import 'package:capsule/src/pages/guide_wk.dart';
import 'package:capsule/src/pages/index_screen_wk.dart';
import 'package:capsule/src/widgets/my_page_row_menu.dart';
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
                const MyPageRowMenu(
                  name: '닉네임',
                  action: Text('닉네임'),
                ),
                const MyPageRowMenu(
                  name: '이메일',
                  action: Text('1234567@naver.com'),
                ),
                MyPageRowMenu(
                  name: '사용자 가이드',
                  action: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Guide(
                              isMyPaged: true,
                            ),
                          ));
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const MyPageRowMenu(
                  name: '버전',
                  action: Text('1.0'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text('로그아웃',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      )),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('로그아웃'),
                          content: const Text('정말 로그아웃 하시겠습니까?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const IndexScreen(),
                                      ));
                                },
                                child: Text(
                                  '확인',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  '취소',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ))
                          ],
                        );
                      },
                    );
                  },
                ),
                Text(
                  '|',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      '회원탈퇴',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
