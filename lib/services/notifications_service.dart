import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_mate/models/notifications/notification.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a single notification to Firestore
  Future<void> addNotification(NotificationModel notification) async {
    try {
      await _firestore
          .collection('notifications')
          .doc(notification.id)
          .set(notification.toMap());
      print("Notification added successfully: ${notification.id}");
    } catch (e) {
      print("Error adding notification: $e");
    }
  }

  // Add a list of notifications to Firestore
  Future<void> addNotifications(List<NotificationModel> notifications) async {
    for (var notification in notifications) {
      await addNotification(notification);
    }
  }
}
