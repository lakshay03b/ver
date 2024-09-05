import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:ver/main.dart';
import 'package:ver/page/notification_screen.dart';

// Define background message handler
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Background message: ${message.notification?.title}');
  print('Background message body: ${message.notification?.body}');
  print('Background message payload: ${message.data}');
  // Add your background message handling logic here
}

// Define Firebase API class
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _localNotification = FlutterLocalNotificationsPlugin();

  // Notification channel for Android
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel_1',
    'High Importance Notification',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('notification2'),
  );

  // Initialize local notifications
  Future<void> initLocalNotification() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        final payload = response.payload;
        if (payload != null) {
          try {
            final Map<String, dynamic> data = jsonDecode(payload);
            final message = RemoteMessage.fromMap(data);
            handleMessage(message);
          } catch (e) {
            print('Error parsing payload: $e');
          }
        }
      },
    );

    final platform = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  // Handle foreground and background notifications
  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle notification taps when the app is opened from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        handleMessage(message);
      }
    });

    // Handle notification taps when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      final sound = 'notification2.wav';
      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/ic_launcher',
            importance: Importance.max,
            sound: RawResourceAndroidNotificationSound(sound.split('.').first),
            enableVibration: true, // You can configure vibration as needed
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  // Initialize FCM and local notifications
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    initPushNotifications();
    initLocalNotification();
  }

  // Handle incoming messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    print('Handling message: ${message.notification?.title}');
    navigatorKey.currentState?.pushNamed(
      NotificationScreen.route,
      arguments: message,
    );
  }
}
