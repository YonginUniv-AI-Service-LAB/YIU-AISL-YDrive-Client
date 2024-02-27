import 'package:aisl_carpool_front/Screens/CarpoolListScreen.dart';
import 'package:aisl_carpool_front/Screens/CarpoolResultListScreen.dart';
import 'package:aisl_carpool_front/Screens/CarpoolScreen.dart';
import 'package:aisl_carpool_front/Screens/DriveFinishScreen.dart';
import 'package:aisl_carpool_front/Screens/LoginScreen.dart';
import 'package:aisl_carpool_front/Screens/MainScreen.dart';
import 'package:aisl_carpool_front/Screens/ModifydataScreen.dart';
import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:aisl_carpool_front/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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

  await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher')),
      onDidReceiveNotificationResponse: (details) {
    print("내용 확인 ${details.payload}");
    if (details.payload == '🚗 카풀 요청') {
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (BuildContext context) => CarpoolListScreen(),
        ),
      );
    } else {
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (BuildContext context) => CarpoolResultListScreen(),
        ),
      );
    }
  });
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   print('A new onMessageOpenedApp event was published!');
  //   print("메세지 타이틀 확인 : ${message.notification?.title}");
  //   if (message.notification?.title == '🚗 카풀 요청') {
  //     navigatorKey.currentState!.push(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => CarpoolScreen(),
  //       ),
  //     );
  //   } else {
  //     navigatorKey.currentState!.push(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => ModifydataScreen(),
  //       ),
  //     );
  //   }
  // });

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
          ),
          payload: notification.title);
    }
  });

  runApp(MyApp(fcmToken: fcmToken));
}

class MyApp extends StatelessWidget {
  final String? fcmToken;
  MyApp({super.key, required this.fcmToken});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data:
            MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        child: MaterialApp(
            navigatorKey: navigatorKey,
            title: 'YDRIVE',
            debugShowCheckedModeBanner: false,
            home: MainScreen(key: key, fcmToken: fcmToken))); //MaterialApp
  }
}
