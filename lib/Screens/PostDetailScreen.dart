import 'dart:io';

import 'package:aisl_carpool_front/Data/Carpool.dart';
import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostDetailScreen extends StatelessWidget {
  final Carpool carpool;

  PostDetailScreen({required this.carpool});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB9BADA),
          title: Container(
            padding: EdgeInsets.only(left: 50),
            child: Row(
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Color(0xFF9EA1CA),
              ),
              iconSize: 40,
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffB9BADA), Colors.white])),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 30),
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: TextButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF4d377b)),
                                        child: Text(carpool.start)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF4d377b)),
                                      child: Text(' -> '),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF4d377b)),
                                        child: Text(carpool.end)),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 17, color: Color(0xFF4d377b)),
                                    child: Text(DateFormat('yyyy-MM-dd HH:mm')
                                        .format(DateTime.parse(carpool.date)))),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 17, color: Color(0xFF4d377b)),
                                    child:
                                        Text('남은 인원 : ${carpool.memberNum}명')),
                              ),
                            ],
                          )),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFF4d377b)),
                        child: Text('차주 Review'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  itemCount: 7,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            child: TextButton(
                                onPressed: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star,
                                            color: Color(0xFF4d377b),
                                          ),
                                          iconSize: 25,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star,
                                            color: Color(0xFF4d377b),
                                          ),
                                          iconSize: 25,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star,
                                            color: Color(0xFF4d377b),
                                          ),
                                          iconSize: 25,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star,
                                            color: Color(0xFFffffff),
                                          ),
                                          iconSize: 25,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star,
                                            color: Color(0xFFffffff),
                                          ),
                                          iconSize: 25,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFF4d377b)),
                                          child: Text(
                                              '차주 텐션이 감당이 안되서\n 힘들었는데 심심하지 않게 간 것 같아\n 되돌아보니 조아욤 날짜'),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          )),
                    );
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 100,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Color(0xFF4d377b)),
                    ),
                    child: (Text(
                      '신청하기',
                      style: TextStyle(color: Color(0xFF4d377b)),
                    )),
                    onPressed: () {
                      applyCarpool(context, carpool.carpoolNum, carpool.email);
                    },
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  Future<void> applyCarpool(
      BuildContext context, int carpoolNum, String email) async {
    final String token = await getToken();
    final String url = "${dotenv.env['API_URL']}:8080/carpool/apply/${carpoolNum}";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({
        'checkNum': 0,
      }),
    );
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('카풀 신청 완료'),
                content: Text('카풀 신청이 완료되었습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => StartScreen()),
                        );
                      },
                      child: Text('확인'))
                ]);
          });
    } else {
      print("실패함");
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
