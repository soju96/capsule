import 'package:capsule/src/pages/notification_setting_screen_wk.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currentTime =
        DateFormat('yyyy. MM. dd. HH:mm aaa').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: const Text(
          '알림',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSettingScreen(),
                  ));
            },
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(children: [
          ListTile(
            leading: Image.asset(
              'assets/images/memo.png',
              width: 50,
            ),
            title: const Text(
              '정기 알람',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('당신의 행복을 적어주세요.'),
                Text(currentTime),
              ],
            ),
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: Image.asset('assets/images/bottle_20.png', width: 50),
            title: const Text(
              '유리병2이 가득찼습니다.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('유리병을 열어주세요.'),
                Text(currentTime),
              ],
            ),
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: Image.asset(
              'assets/images/bottle_20.png',
              width: 50,
            ),
            title: const Text(
              '유리병1이 가득찼습니다.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('유리병을 열어주세요.'),
                Text(currentTime),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
