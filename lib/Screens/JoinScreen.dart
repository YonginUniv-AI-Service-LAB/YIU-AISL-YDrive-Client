// 회원 가입 화면
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'LoginScreen.dart';

class JoinScreen extends StatefulWidget {
  JoinScreen({Key? key}) : super(key: key);

  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final homeController = TextEditingController();
  final pwdController = TextEditingController();
  final carNumController = TextEditingController();
  final authNumController = TextEditingController();
  String? emailCheckResult;
  String? emailCodeCheckResult;

  bool _nameValidate = false;
  bool _emailValidate = false;
  bool _phoneValidate = false;
  bool _homeValidate = false;
  bool _pwdValidate = false;
  bool _carNumValidate = false;

  bool _authNumValidate = false;
  bool _emailCodeChecked = false;

  FocusNode _authNumFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffB9BADA),
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
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
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
                                  child: Text('이름'))),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF9EA1CA))),
                                errorText: _nameValidate ? '이름을 입력해주세요.' : null,
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
                                child: Text('전화번호')),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF9EA1CA))),
                                errorText:
                                    _phoneValidate ? '전화번호를 입력해주세요.' : null,
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
                                child: Text('학번')),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              height: 40,
                              width: 300,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 30.0, bottom: 10),
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
                                                fontSize: 15,
                                                color: Color(0xFF000000)),
                                            child: Text('인증코드')),
                                        onPressed: () async {
                                          try {
                                            await emailCheck(
                                                emailController.text);
                                          } catch (e) {
                                            setState(() {
                                              emailCheckResult =
                                                  'email check failed: $e';
                                            });
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
                                child: Text('인증코드 확인')),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              height: 40,
                              width: 300,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 30.0, bottom: 10),
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
                                child: Text('비밀번호')),
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
                                            content:
                                                Text('인증코드 확인을 먼저 진행해 주세요.'),
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
                                errorText:
                                    _pwdValidate ? '비밀번호를 입력해주세요.' : null,
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
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
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
                                child: Text('주소')),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            height: 50,
                            width: 300,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  height: 40,
                                  width: 120,
                                  child: TextFormField(
                                    onTap: () {
                                      if (!_emailCodeChecked) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  title: Text('경고'),
                                                  content: Text(
                                                      '인증코드 확인을 먼저 진행해 주세요.'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  _authNumFocus);
                                                        },
                                                        child: Text('확인'))
                                                  ]);
                                            });
                                      }
                                    },
                                    controller: homeController,
                                    decoration: InputDecoration(
                                      suffixIconColor: Color(0xFF9EA1CA),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF9EA1CA))),
                                      errorText:
                                          _homeValidate ? '주소를 입력해주세요.' : null,
                                    ),
                                  ),
                                ),
                              ],
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
                                child: Text('차량번호')),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 30,
                            width: 300,
                            child: TextFormField(
                              onTap: () {
                                if (!_emailCodeChecked) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            title: Text('경고'),
                                            content:
                                                Text('인증코드 확인을 먼저 진행해 주세요.'),
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
                              controller: carNumController,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
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
                            side: BorderSide(
                                width: 1.0, color: Color(0xffC1BDDA)),
                          ),
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF000000)),
                              child: Text('JOIN')),
                          onPressed: () {
                            join(
                                nameController.text,
                                emailController.text,
                                phoneController.text,
                                homeController.text,
                                pwdController.text,
                                carNumController.text);
                          },
                        ),
                      )
                    ])
                  ],
                ),
              ),
            )));
  }

  void join(String name, String email, String phone, String home, String pwd,
      String carNum) async {
    setState(() {
      _nameValidate = name.isEmpty;
      _emailValidate = email.isEmpty;
      _phoneValidate = phone.isEmpty;
      _homeValidate = home.isEmpty;
      _pwdValidate = pwd.isEmpty;
      _carNumValidate = carNum.isEmpty;
    });

    if (!_nameValidate &&
        !_emailValidate &&
        !_phoneValidate &&
        !_homeValidate &&
        !_pwdValidate &&
        !_carNumValidate) {
      var url = Uri.parse("${dotenv.env['API_URL']}:8080/join");
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'phone': phone,
          'home': home,
          'pwd': pwd,
          'carNum': carNum
        }),
      );
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('회원가입 완료'),
                  content: Text('회원가입이 완료되었습니다.'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()),
                          );
                        },
                        child: Text('확인'))
                  ]);
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('회원가입 실패'),
                  content: Text('회원가입에 실패하셨습니다.'),
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

  Future<void> emailCheck(String email) async {
    var url = Uri.parse("${dotenv.env['API_URL']}:8080/join/emailCheck"); // Android
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
