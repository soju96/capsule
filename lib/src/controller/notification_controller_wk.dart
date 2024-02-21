import 'package:capsule/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// 백그라운드에서 수신된 메시지를 처리하는 핸들러
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

// 푸시 알림 설정 및 권한 요청하는 함수
Future<String?> notificationSetting() async {
  // Firebase 초기화
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 백그라운드 메시지 핸들러 설정
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Firebase 메시징 인스턴스 생성
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // 포그라운드에서 알림 표시 옵션 설정
  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // 알림 권한 요청
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // 사용자가 알림 권한을 부여했는지 확인
  print('User granted permission: ${settings.authorizationStatus}');

  // Android용 알림 채널 정의
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'id',
    'name',
    description: '알림입니다.',
    importance: Importance.max,
  );

  // Flutter Local Notifications 플러그인을 사용하여 채널 등록
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // 포그라운드에서 알림 수신 시 처리
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null && android != null) {
      // 포그라운드에서 알림 표시
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ));

      print('Message also contained a notification: ${message.notification}');
    }
  });

  // Firebase 토큰 발급
  String? firebaseToken = await messaging.getToken();
  print("firebaseToken : $firebaseToken");
  return firebaseToken;
}
