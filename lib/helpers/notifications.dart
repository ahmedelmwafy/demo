import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsService {
  NotificationsService._();
  static NotificationsService instance = NotificationsService._();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final String serverToken =
      'AAAA8Ch3dck:APA91bH2iGa529ktEMrrViBNUheX89bRSVWdzSRM9yMmJ_GUuxuu4zlNkqxpP4pOTgUeqYfx2MqwxpQpcOe8bnU479qoSfYLiKPcjo2j4kHM_bywmFW_lkQWeO7PtoeABjRp22zc55tB';
  final channelId = 'likes_channel';
  Future<NotificationsService> init() async {
    log("Notification service initiated...");
    setup();
    return this;
  }

  Future<void> setup() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }

    // Flutter Local Notification Init
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    //Create custom channel
    final AndroidNotificationChannel channel = AndroidNotificationChannel(
        channelId, // id
        'likes_channel', // name
        description: 'Likes Notification', // description
        importance: Importance.max);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');

      showNotification(
          message.notification.hashCode,
          message.notification?.title ?? '',
          message.notification?.body ?? '',
          message.data);
    });
  }

  Future onSelectNotification(payload) async {}

  void showNotification(
      int id, String title, String body, Map<String, dynamic> message) {
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId, // id
          'high_importance_channel', // name
          channelDescription: 'General Notification', // description
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: json.encode(message),
    );
  }


  Future<void> sendNotification(String title, String body, String token) async {

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
            // 'android_channel_id': channelId
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': token,
        },
      ),
    );
  }
}
