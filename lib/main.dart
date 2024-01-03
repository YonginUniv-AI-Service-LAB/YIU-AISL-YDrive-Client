import 'package:aisl_carpool_front/Screens/ApplyCheckScreen.dart';
import 'package:aisl_carpool_front/Screens/MainScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YDRIVE',
      debugShowCheckedModeBanner: false,
      home: new MainScreen(),
    ); //MaterialApp
  }
}
