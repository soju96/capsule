import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  late SharedPreferences _prefs;
  bool _appNotificationChecked = false;
  bool _memoNotificationChecked = false;
  bool _randomNotificationChecked = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _appNotificationChecked = _prefs.getBool('app_notification') ?? false;
      _memoNotificationChecked =
          _prefs.getBool('message_notification') ?? false;
      _randomNotificationChecked =
          _prefs.getBool('random_notification') ?? false;
    });
  }

  Future<void> _saveSettings() async {
    await _prefs.setBool('app_notification', _appNotificationChecked);
    await _prefs.setBool('message_notification', _memoNotificationChecked);
    await _prefs.setBool('random_notification', _randomNotificationChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: const Text(
          '알림 설정',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            buildNotificationRow('앱 푸시 알림', _appNotificationChecked, (value) {
              setState(() {
                _appNotificationChecked = value;
                _memoNotificationChecked = value;
                _randomNotificationChecked = value;
                _saveSettings();
              });
            }),
            buildNotificationRow('쪽지 작성 알림', _memoNotificationChecked, (value) {
              setState(() {
                _memoNotificationChecked = value;
                _saveSettings();
              });
            }),
            buildNotificationRow('랜덤 쪽지 알림', _randomNotificationChecked,
                (value) {
              setState(() {
                _randomNotificationChecked = value;
                _saveSettings();
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationRow(
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            CupertinoSwitch(
                activeColor: Theme.of(context).primaryColor,
                value: value,
                onChanged: onChanged)
          ],
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
