import 'package:capsule/src/models/notification_model.dart';
import 'package:capsule/src/pages/notification_setting_screen_wk.dart';
import 'package:capsule/src/services/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        notificationService.addFirebaseNotification(notification);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> notifications =
        notificationService.getNotifications();

    notifications.sort((a, b) => b.time.compareTo(a.time));

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
                ),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            NotificationModel notification = notifications[index];
            String currentTime =
                DateFormat('yyyy. MM. dd. HH:mm aaa').format(notification.time);

            return Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/images/memo.png',
                    width: 50,
                  ),
                  title: Text(
                    notification.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.description),
                      Text(currentTime),
                    ],
                  ),
                ),
                const Divider(color: Colors.black),
              ],
            );
          },
        ),
      ),
    );
  }
}
