import 'package:capsule/src/pages/notification_screen_wk.dart';
import 'package:capsule/src/pages/memo_screen_sj.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottleScreen extends StatelessWidget {
  String name = 'name'; // 기본값 설정

  BottleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserId(), // SharedPreferences에서 사용자 ID를 가져오는 함수 호출
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // 사용자 ID를 가져와서 설정
          if (snapshot.hasData && snapshot.data != null) {
            name = snapshot.data!;
          }
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            title: Text(
              '$name의 행복 저금통',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications_outlined),
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty_uncap_bottle.png',
                      width: 300,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const Text(
                          '당신의 첫 행복을 적금하세요.',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MemoInput(),
                                ),
                              );
                            },
                            icon: Image.asset(
                              'assets/images/pen.png',
                              width: 35,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Image.asset('assets/images/shelf.png'),
              ],
            ),
          ),
        );
      },
    );
  }

  // SharedPreferences에서 사용자 ID를 가져오는 비동기 함수
  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }
}
