import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // 사용자 로그인 및 Firebase 인증
  Future<User?> signInWithIdAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // Firebase에 사용자 정보 저장
  Future<void> saveUserInfoToFirebase(User user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        // 추가적인 사용자 정보 필드를 여기에 저장할 수 있습니다.
      });
    } catch (e) {
      print("Error saving user info to Firestore: $e");
    }
  }

  // FCM 토큰 관리
  Future<void> manageFCMToken(User user) async {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      try {
        await _firestore.collection('users').doc(user.uid).update({
          'fcmToken': token,
        });
        print("FCM Token saved for user: ${user.uid}");
      } catch (e) {
        print("Error saving FCM token: $e");
      }
    }
  }
}
