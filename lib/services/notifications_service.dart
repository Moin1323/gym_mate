import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../view/Notifications/notifications_view.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User denied permission');
    }
  }

  // Function to initialize local notifications
  // Modify initLocalNotifications
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Check if the notification has any payload or specific data
        if (response.payload != null) {
          // Handle the payload here and navigate to HomeView or any specific view
          Get.to(() => NotificationsView());
        }
      },
    );
  }

  // Firebase message listener
  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      // App is in the foreground and a notification is received
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }
      showNotification(message);
    });

    // Handle when the app is opened from a notification (background/terminated state)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Navigate to HomeView when the app is opened from a notification
      Get.to(() => NotificationsView());
    });
  }

  // Function to show the notification
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'High Importance Notifications',
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    // Display the notification
    _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'No title',
      message.notification?.body ?? 'No body',
      notificationDetails,
    );
  }

  // Get device token for push notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  // Refresh device token
  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      print('Token refreshed: $event');
    });
  }
}
