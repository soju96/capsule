import 'package:capsule/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<bool> requestNotificationPermissions() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<String?> saveDeviceToken() async {
    String? token = await _firebaseMessaging.getToken();
    // 여기에 토큰 저장 로직을 추가할 수 있습니다.
    print('토큰: $token');
    return token;
  }

  // void initialize() {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print("onMessage: $message");
  //     // 알림 수신 시 처리할 로직을 여기에 추가합니다.
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print("onMessageOpenedApp: $message");
  //     // 앱이 백그라운드에서 실행 중일 때 알림을 클릭하여 앱이 다시 포그라운드로 돌아온 경우 처리할 로직을 여기에 추가합니다.
  //   });
  // }

  // static Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   print("Handling a background message: ${message.messageId}");
  //   // 앱이 백그라운드 상태일 때 알림을 처리할 로직을 여기에 추가합니다.
  // }

  void setUpFirebase() {
    // 백그라운드 메시지, 앱이 실행 중일 때의 메시지, 앱이 종료된 상태에서 열린 메시지에 대한 핸들러 구성
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);
    FirebaseMessaging.onMessageOpenedApp
        .listen(_firebaseMessagingOpenedAppHandler);
  }

  // 백그라운드 메시지를 처리하는 핸들러
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("백그라운드 메시지를 처리합니다: ${message.messageId}");
    // 여기서 메시지 처리
  }

  // 앱이 실행 중일 때의 메시지를 처리하는 핸들러
  Future<void> _firebaseMessagingForegroundHandler(
      RemoteMessage message) async {
    print("실행 중인 앱에서 메시지를 처리합니다: ${message.messageId}");
    // 여기서 메시지 처리
    RemoteNotification? notification = message.notification;
    print(notification?.title);
    print(notification?.body);
  }

  // 앱이 종료된 상태에서 열린 메시지를 처리하는 핸들러
  Future<void> _firebaseMessagingOpenedAppHandler(RemoteMessage message) async {
    print("종료된 상태에서 열린 메시지를 처리합니다: ${message.messageId}");
    // 여기서 메시지 처리
  }

//   // 백그라운드에서 수신된 메시지를 처리하는 핸들러
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }

// 푸시 알림 설정 및 권한 요청하는 함수
  Future<String?> notificationSetting() async {
    // Firebase 초기화
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);

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

    // Android용 알림 채널 정의
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'id',
      'name',
      description: '알림입니다.',
      importance: Importance.max,
    );

    // Flutter Local Notifications 플러그인을 사용하여 채널 등록
    // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    //     FlutterLocalNotificationsPlugin();
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(channel);

    // 포그라운드에서 알림 수신 시 처리
    // FirebaseMessaging.onMessage.listen(
    //   (RemoteMessage message) {
    //     RemoteNotification? notification = message.notification;
    //     AndroidNotification? android = message.notification?.android;

    //     print('Got a message whilst in the foreground!');
    //     print('Message data: ${message.data}');
    //     print('Notification title: ${notification?.title}');
    //     print('Notification body: ${notification?.body}');
    //     print(message);

    // if (message.notification != null && android != null) {
    //   // 포그라운드에서 알림 표시
    //   flutterLocalNotificationsPlugin.show(
    //       notification.hashCode,
    //       notification?.title,
    //       notification?.body,
    //       NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           channelDescription: channel.description,
    //           icon: android.smallIcon,
    //         ),
    //       ));

    //   print(
    //       'Message also contained a notification: ${message.notification}');
    // }
    //   },
    // );
    return null;
  }
}
