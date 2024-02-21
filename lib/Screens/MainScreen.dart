import 'package:aisl_carpool_front/Screens/JoinScreen.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class MainScreen extends StatelessWidget {
  final String? fcmToken;
  MainScreen({super.key, required this.fcmToken});
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
      bool exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("앱 종료"),
            content: Text("앱을 종료하시겠습니까?"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pop(false), // 아니요를 선택하면 다이얼로그를 닫습니다.
                child: Text('아니요'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pop(true), // 예를 선택하면 다이얼로그를 닫고 앱을 종료합니다.
                child: Text('예'),
              ),
            ],
          ));
      return exit ?? false;
    },
     child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffE6E1EF), Colors.white])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/titleLogo.png',
                    width: 100,
                    scale: 1.3,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(fontSize: 40, color: Color(0xffC1BDDA)),
                      child: Text('Y')),
                  DefaultTextStyle(
                      style: TextStyle(fontSize: 40, color: Color(0xffFFFFFF)),
                      child: Text('DRIVE'))
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xffC1BDDA),
                      side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                    ),
                    child: (DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF000000)),
                        child: Text('LOGIN'))),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen(fcmToken: fcmToken,)),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff000000)),
                        child: Text('계정이 없나요?')),
                    TextButton(
                      child: (Text('계정 생성하기')),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => JoinScreen(fcmToken: fcmToken,)),
                        );
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    )); //MaterialApp
  }
}
