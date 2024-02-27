// 로그인 화면
//import 'dart:html';

import 'package:aisl_carpool_front/Screens/CarpoolListScreen.dart';
import 'package:aisl_carpool_front/Screens/FindpwdScreen.dart';
import 'package:aisl_carpool_front/Screens/JoinScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  final String? fcmToken;
  LoginScreen({super.key, required this.fcmToken});

  final emailController = TextEditingController();
  final pwdController = TextEditingController();

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
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffE6E1EF),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/titleLogo.png',
                          width: 80, scale: 1.3),
                      DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 40, color: Color(0xFF9EA1CA)),
                          child: Text('Y')),
                      DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 40, color: Color(0xffFFFFFF)),
                          child: Text('DRIVE')),
                    ],
                  ),
                ],
              ),
            ),
            resizeToAvoidBottomInset: false,
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF9EA1CA)),
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFF000000)),
                              child: Text('학번')),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          height: 30,
                          width: 300,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF9EA1CA)))),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF9EA1CA)),
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFF000000)),
                              child: Text('비밀번호')),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          height: 30,
                          width: 300,
                          child: TextField(
                            obscureText: true,
                            controller: pwdController,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF9EA1CA)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      width: 100,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF9EA1CA),
                          side:
                              BorderSide(width: 1.0, color: Color(0xFF9EA1CA)),
                        ),
                        child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF000000)),
                            child: Text('LOGIN')),
                        onPressed: () {
                          login(emailController.text, pwdController.text,
                              fcmToken, context);
                        },
                      ),
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: (Text('계정 생성하기')),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    JoinScreen(fcmToken: fcmToken)),
                          );
                        },
                      ),
                      TextButton(
                        child: (Text('비밀번호 찾기')),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FindpwdScreen(fcmToken: fcmToken)),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void login(
      String email, String pwd, String? fcmToken, BuildContext context) async {
    var status = await Permission.notification.status;

    if (status.isGranted) {
      // If granted, proceed with the login
      print("권한 설정 완료");
    } else if (status.isDenied || status.isRestricted) {
      print("권한 설정 실패");
      // If not granted, request it
      status = await Permission.notification.request();
      if (status.isGranted) {
        print("권한 설정 다시 완료");
        // If user granted permission, proceed with the login
      } else {
        print("권한 설정 다시 실패");
        // If user didn't grant permission, show an alert or something
      }
    }
    var url = Uri.parse("${dotenv.env['API_URL']}:8080/login");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{'email': email, 'pwd': pwd, 'fcmToken': fcmToken}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> tokenInfo = body['token'];
      String token = tokenInfo['accessToken'];
      setToken(token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => StartScreen()),
          (route) => false);
    } else if (response.statusCode == 400) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('알림'),
            content: Text('학번과 비밀번호를 모두 입력해주세요.'),
            actions: <Widget>[
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (response.statusCode == 402) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('알림'),
              content: Text('회원가입을 하지 않은 사용자 입니다.'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                JoinScreen(fcmToken: fcmToken)),
                      );
                    },
                    child: Text('회원가입하러 가기'))
              ],
            );
          });
    } else if (response.statusCode == 401) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('알림'),
              content: Text('학번과 비밀번호가 일치하지 않습니다.'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('회원가입하러 가기'))
              ],
            );
          });
    }
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
