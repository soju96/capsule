import 'package:capsule/src/pages/notification_setting_screen_wk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: const Text(
          '알림',
          style: TextStyle(
            color: Colors.black,
          ),
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
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('notifications').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length * 2 - 1,
            itemBuilder: (context, index) {
              if (index.isOdd) {
                return const Divider(
                  color: Colors.black,
                );
              }
              final int itemIndex = index ~/ 2;
              Timestamp timestamp = snapshot.data!.docs[itemIndex]['timestamp'];
              DateTime dateTime = timestamp.toDate();
              return ListTile(
                leading: Image.asset(
                  'assets/images/memo.png',
                  width: 40,
                ),
                title: Text(snapshot.data!.docs[itemIndex]['title']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data!.docs[itemIndex]['body']),
                    Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime)),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
