import 'package:aisl_carpool_front/Screens/MainScreen.dart';
import 'package:aisl_carpool_front/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_options.dart';

Future<void> _backgroundHandler(RemoteMessage message) async {}

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? fcmToken = await messaging.getToken();
  print(
      "fcmToken 발급 성공이다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!: $fcmToken");

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: '@mipmap/ic_launcher',
              //icon: 'title_logo',
            ),
          ));
    }
  });

  runApp(MyApp(fcmToken: fcmToken));
}

class MyApp extends StatelessWidget {
  final String? fcmToken;
  MyApp({super.key, required this.fcmToken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'YDRIVE',
        debugShowCheckedModeBanner: false,
        home: MainScreen(key: key, fcmToken: fcmToken)); //MaterialApp
  }
}
