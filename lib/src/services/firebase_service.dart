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
      _saveTokenToFirestore(token); // 토큰을 Firestore에 저장
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
      String type = message.data['type'] ?? 'default';
      await _firestore.collection('notifications').add({
        'type': type,
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

  void _saveTokenToFirestore(String? token) {
    if (token != null) {
      try {
        _firestore.collection('tokens').doc(token).set({
          'token': token,
          'timestamp': Timestamp.now(),
        });
        print("Token saved to Firestore");
      } catch (e) {
        print("Error saving token to Firestore: $e");
      }
    }
  }

  Future<void> saveIdAndToken(String id, String token) async {
    try {
      await _firestore.collection('users').doc(id).set({
        'id': id,
        'token': token,
      });
      print('ID and token saved to Firestore');
    } catch (e) {
      print('Error saving ID and token to Firestore: $e');
    }
  }

  Future<String?> getFCMToken() async {
    try {
      return await _firebaseMessaging.getToken();
    } catch (e) {
      print("Error getting FCM token: $e");
      return null;
    }
  }
}
