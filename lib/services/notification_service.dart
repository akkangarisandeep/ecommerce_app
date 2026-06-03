import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  final FirebaseMessaging
  firebaseMessaging =
      FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin
  localNotifications =
  FlutterLocalNotificationsPlugin();

  Future initialize() async {

    // Permissi
    await firebaseMessaging
        .requestPermission();

    // Android Settings
    const AndroidInitializationSettings
    androidSettings =

    AndroidInitializationSettings(
        '@mipmap/ic_launcher');

    const InitializationSettings
    settings =

    InitializationSettings(
      android: androidSettings,
    );

    await localNotifications.initialize(
        settings);

    // Foreground Notifications
    FirebaseMessaging.onMessage
        .listen((message) {

      showNotification(

        message.notification?.title ??
            "Notification",

        message.notification?.body ??
            "",
      );
    });

    // Device Token
    String? token =

    await firebaseMessaging
        .getToken();

    print("FCM TOKEN: $token");
  }

  Future showNotification(

      String title,
      String body) async {

    const AndroidNotificationDetails
    androidDetails =

    AndroidNotificationDetails(

      'channel_id',
      'channel_name',

      importance:
      Importance.max,

      priority:
      Priority.high,
    );

    const NotificationDetails
    details =

    NotificationDetails(
      android: androidDetails,
    );

    await localNotifications.show(

      0,
      title,
      body,
      details,
    );
  }
}