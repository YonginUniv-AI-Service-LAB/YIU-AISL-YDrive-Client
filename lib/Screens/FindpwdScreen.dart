import 'package:aisl_carpool_front/Screens/LoginScreen.dart';
import 'package:aisl_carpool_front/Screens/ModifydataScreen.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FindpwdScreen extends StatefulWidget {
  final String? fcmToken;
  FindpwdScreen({super.key, required this.fcmToken});

  _FindpwdScreenState createState() => _FindpwdScreenState();
}

class _FindpwdScreenState extends State<FindpwdScreen> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final authNumController = TextEditingController();
  String? emailCheckResult;
  String? emailCodeCheckResult;
  bool _emailValidate = false;

  bool _authNumValidate = false;
  bool _emailCodeChecked = false;

  FocusNode _authNumFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                child: Column(children: [
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
                            padding: EdgeInsets.only(bottom: 10),
                            height: 40,
                            width: 300,
                            child: Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(right: 30.0, bottom: 10),
                                  child: SizedBox(
                                    width: 170,
                                    // height: 40,
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF9EA1CA))),
                                        errorText: _emailValidate
                                            ? '학번을 입력해주세요.'
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xFF9EA1CA),
                                        side: BorderSide(
                                            width: 1.0,
                                            color: Color(0xffC1BDDA)),
                                      ),
                                      child: DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF000000)),
                                          child: Text('인증코드')),
                                      onPressed: () {}),
                                )
                              ],
                            )),
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
                              child: Text('인증코드 확인')),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 10),
                            height: 40,
                            width: 300,
                            child: Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(right: 30.0, bottom: 10),
                                  child: SizedBox(
                                    width: 170,
                                    height: 20,
                                    child: TextField(
                                      controller: authNumController,
                                      focusNode: _authNumFocus,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF9EA1CA)))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Color(0xFF9EA1CA),
                                        side: BorderSide(
                                            width: 1.0,
                                            color: Color(0xffC1BDDA)),
                                      ),
                                      child: DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF000000)),
                                          child: Text('확인')),
                                      onPressed: () async {
                                        setState(() {
                                          _authNumValidate =
                                              authNumController.text.isEmpty;
                                        });
                                        if (!_authNumValidate) {
                                          try {
                                            await emailCodeCheck(
                                                authNumController.text);
                                          } catch (e) {
                                            setState(() {
                                              emailCodeCheckResult =
                                                  'email check failed: $e';
                                            });
                                          }
                                        }
                                      }),
                                )
                              ],
                            )),
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
                              child: Text('새 비밀번호')),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          height: 40,
                          width: 300,
                          child: TextFormField(
                            onTap: () {
                              if (!_emailCodeChecked) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text('경고'),
                                          content: Text('인증코드 확인을 먼저 진행해 주세요.'),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _authNumFocus);
                                                },
                                                child: Text('확인'))
                                          ]);
                                    });
                              }
                            },
                            controller: pwdController,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF9EA1CA))),
                            ),
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
                              child: Text('비밀번호 확인')),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          height: 30,
                          width: 300,
                          child: TextFormField(
                            obscureText: true,
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
                          backgroundColor: Color(0xffC1BDDA),
                          side:
                              BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                        ),
                        child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF000000)),
                            child: Text('수정하기')),
                        onPressed: () {
                          changePwd(pwdController.text);
                        },
                      ),
                    )
                  ]),
                ]))));
  }

  void changePwd(String pwd) async {
    var url = Uri.parse("${dotenv.env['API_URL']}:8080/user/changepwd");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'pwd': pwd,
      }),
    );
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('비밀번호 변경 완료'),
                content: Text('비밀번호가 변경되었습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen(fcmToken: widget.fcmToken)),
                        );
                      },
                      child: Text('확인'))
                ]);
          });
    } else if (response.statusCode == 400) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('비밀번호 입력 필요'),
                content: Text('변경하실 비밀번호를 입력해주세요.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<void> emailCheck(String email) async {
    var url =
        Uri.parse("${dotenv.env['API_URL']}:8080/join/emailCheck"); // Android
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('인증 코드 전송 완료'),
                content: Text('해당 이메일로 인증 코드가 전송되었습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
    }
  }

  Future<void> emailCodeCheck(String authNum) async {
    var url = Uri.parse("${dotenv.env['API_URL']}:8080/join/emailCheckTrue");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'authNum': authNum,
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        _emailCodeChecked = true;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('이메일 인증'),
                content: Text('이메일 인증에 성공하셨습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
    }
  }
}
