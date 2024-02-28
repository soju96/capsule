import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Firebase 초기화 및 FCM 수신을 처리하는 메서드
  Future<void> initialize() async {
    // FCM 토큰 수신 리스너 설정
    _firebaseMessaging.getToken().then((String? token) {
      print("FCM Token: $token");
      // 여기서 토큰을 사용하여 필요한 작업 수행
    });

    // FCM 메시지 핸들러 등록
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("FCM Message Data: ${message.data}");

      // Firestore에 메시지 저장
      await _saveMessageToFirestore(message);
    });

    // 백그라운드 메시지 핸들러 설정 (앱이 종료된 상태에서도 FCM 메시지 처리 가능)
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // FCM 메시지를 Firestore에 저장하는 메서드
  Future<void> _saveMessageToFirestore(RemoteMessage message) async {
    try {
      await _firestore.collection('notifications').add({
        'title': message.notification?.title ?? '',
        'body': message.notification?.body ?? '',
        'timestamp': Timestamp.now(), // 현재 시간 사용 또는 메시지의 시간 사용 가능
        // 기타 필요한 데이터도 저장할 수 있음
      });
    } catch (e) {
      print("Error saving message to Firestore: $e");
    }
  }

  // 백그라운드 메시지 핸들러
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    // 여기서 메시지 처리 가능
  }
}
