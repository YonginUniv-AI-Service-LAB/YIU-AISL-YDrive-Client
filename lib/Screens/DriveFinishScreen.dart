import 'dart:convert';

import 'package:aisl_carpool_front/Screens/PostDetailScreen.dart';
import 'package:aisl_carpool_front/Screens/ReviewWriteFor4Screen.dart';
import 'package:aisl_carpool_front/Screens/ReviewWriteScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Data/Carpool.dart';
import 'MyPageScreen.dart';

class DrivefinishScreen extends StatefulWidget {
  final Carpool carpool;

  DrivefinishScreen({required this.carpool});

  _DrivefinishScreen createState() => _DrivefinishScreen();
}

class _DrivefinishScreen extends State<DrivefinishScreen> {
  late String userEmail;

  @override
  void initState() {
    super.initState();
    fetchUserEmail();
    userEmail = '';
  }

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
                    Image.asset('assets/titleLogo.png', width: 80, scale: 1.3),
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
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF9EA1CA),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10, top: 10),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF000000)),
                                child: Text('경로정보'),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 23,
                                  width: 60,
                                  margin: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF9EA1CA)),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text('출발')),
                                ),
                                Expanded(
                                  // width: 90,
                                  // margin: EdgeInsets.only(top: 3, left: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text(widget.carpool.start)),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10, left: 25),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF000000)),
                                child: Text('↓'),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 23,
                                  width: 60,
                                  margin: EdgeInsets.only(bottom: 20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF9EA1CA)),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text('도착')),
                                ),
                                Expanded(
                                  // width: 90,
                                  // margin: EdgeInsets.only(top: 3, left: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text(widget.carpool.end)),
                                ),
                              ],
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: DefaultTextStyle(
                                  style: TextStyle(
                                      fontSize: 17, color: Color(0xFF000000)),
                                  child: Text(
                                      '카풀 세부 정보') //Text(nameController.text),
                                  ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 23,
                                  width: 60,
                                  margin: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF9EA1CA)),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text('날짜')),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3, left: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text(DateFormat('yyyy.MM.dd')
                                          .format(DateTime.parse(
                                              widget.carpool.date)))),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 23,
                                  width: 60,
                                  margin: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF9EA1CA)),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text('시간')),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3, left: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text(DateFormat('HH:mm').format(
                                          DateTime.parse(
                                              widget.carpool.date)))),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 23,
                                  width: 60,
                                  margin: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF9EA1CA)),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text('인원')),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3, left: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child:
                                          Text('${widget.carpool.memberNum}명')),
                                ),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/Air.png',
                          width: 50, scale: 0.8, color: Color(0xffC1BDDA)),
                      Image.asset('assets/titleLogo.png',
                          width: 100, scale: 0.8, color: Color(0xffC1BDDA)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: 300,
                  child: Column(
                    children: [
                      DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFF000000)),
                          child: Text('목적지로 이동중입니다.')),
                      DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFF000000)),
                          child: Text('도착하면 도착완료 버튼을 눌러주세요.')),
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xffC1BDDA),
                        side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                      ),
                      child: (DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 13, color: Color(0xFF000000)),
                          child: Text('도착완료'))),
                      onPressed: () {
                        reviewWrite(widget.carpool.carpoolNum, context);
                      },
                    ),
                  )
                ]),
              ],
            ),
          ),
        ));
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  void reviewWrite(int carpoolNum, BuildContext context) async {
    var token = await getToken();
    var url =
        Uri.parse("${dotenv.env['API_URL']}:8080/carpool/${carpoolNum}/finish");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('도착 완료'),
            content: Text('도착을 완료하였습니다.'),
            actions: <Widget>[
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  if (widget.carpool.email == userEmail) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ReviewWriteFor4Screen(
                                  carpool: widget.carpool,
                                )),
                        (context) => false);
                  } else {
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //       builder: (BuildContext context) =>
                    //           ReviewWriteScreen(carpool: widget.carpool)),
                    // );
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<String> fetchUserEmail() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse(
          "${dotenv.env['API_URL']}:8080/user/getStatus"), // 사용자 상태를 가져오는 API endpoint
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      String email = jsonResponse['email'];
      print(email);
      userEmail = email;
      return email;
    } else {
      throw Exception('Failed to fetch user status');
    }
  }
}
