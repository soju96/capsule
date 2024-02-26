import 'package:capsule/src/models/notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  List<NotificationModel> notificatgions = [];

  void addFirebaseNotification(RemoteNotification? notification) {
    if (notification != null) {
      notificatgions.insert(
          0,
          NotificationModel(
            title: notification.title ?? '알림',
            description: notification.body ?? '',
            time: DateTime.now(),
          ));
    }
  }

  List<NotificationModel> getNotifications() {
    // 알림을 최신순으로 정렬하여 반환합니다.
    return notificatgions.reversed.toList();
  }
}
