import 'package:aisl_carpool_front/Screens/ModifydataScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyPageScreen extends StatefulWidget {
  MyPageScreen({Key? key}) : super(key: key);

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final homeController = TextEditingController();
  final carNumController = TextEditingController();

  void initState() {
    super.initState();
    fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE6E1EF),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xFF9EA1CA),
            ),
            iconSize: 40,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset('assets/titleLogo.png', width: 80, scale: 1.3),
                  DefaultTextStyle(
                      style: TextStyle(fontSize: 40, color: Color(0xFF9EA1CA)),
                      child: Text('Y')),
                  DefaultTextStyle(
                      style: TextStyle(fontSize: 40, color: Color(0xffFFFFFF)),
                      child: Text('DRIVE')),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => StartScreen()),
                );
              },
              icon: Icon(
                Icons.home,
                color: Color(0xFF9EA1CA),
              ),
              iconSize: 40,
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 30),
                child: Container(
                  padding: EdgeInsets.all(30),
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
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF000000)),
                            child: Text('이름'),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF000000)),
                            child: Text('전화번호'),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF000000)),
                            child: Text('지역'),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF000000)),
                            child: Text('차량번호'),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFF000000)),
                              child: Text(nameController.text)),
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF000000)),
                            child: Text(phoneController.text),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF000000)),
                            child: Text(homeController.text),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF000000)),
                            child: Text(carNumController.text),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 130,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF9EA1CA),
                      side: BorderSide(width: 1.0, color: Color(0xFF9EA1CA)),
                    ),
                    child: (Text(
                      '수정하기',
                      style: TextStyle(color: Color(0xFF000000)),
                    )),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ModifydataScreen()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF9EA1CA),
                      side: BorderSide(width: 1.0, color: Color(0xFF9EA1CA)),
                    ),
                    child: (Text(
                      '탑승자로 전환',
                      style: TextStyle(color: Color(0xFF000000)),
                    )),
                    onPressed: () {},
                  ),
                )
              ]),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFF9EA1CA)),
                        child: Text('이용내역'),
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(left: 60),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF9EA1CA),
                          side:
                              BorderSide(width: 1.0, color: Color(0xFF9EA1CA)),
                        ),
                        child: (Text(
                          '차주',
                          style:
                              TextStyle(color: Color(0xFF000000), fontSize: 17),
                        )),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF),
                          side:
                              BorderSide(width: 1.0, color: Color(0xFF9EA1CA)),
                        ),
                        child: (Text(
                          '탑승자',
                          style:
                              TextStyle(color: Color(0xFF000000), fontSize: 17),
                        )),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF9EA1CA),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            child: TextButton(
                              onPressed: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 20, top: 10),
                                            child: DefaultTextStyle(
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xFF000000)),
                                              child: Text('이용 날짜'),
                                            ),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 20, top: 10),
                                            child: DefaultTextStyle(
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xFF000000)),
                                              child: Text('2023년 12월 30일'),
                                            ),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 23,
                                        width: 60,
                                        margin: EdgeInsets.only(bottom: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFF9EA1CA)),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF000000)),
                                            child: Text('출발')),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 3, left: 10),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFF000000)),
                                            child: Text('신논현역 3번')),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 10, left: 25),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('↓'),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 23,
                                        width: 60,
                                        margin: EdgeInsets.only(bottom: 20),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFF9EA1CA)),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF000000)),
                                            child: Text('도착')),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 3, left: 10),
                                        child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFF000000)),
                                            child: Text('용인대학교')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void fetchProfile() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse("${dotenv.env['API_URL']}:8080/myprofile"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var body = utf8.decode(response.bodyBytes);
      Map<String, dynamic> profile = jsonDecode(response.body);
      setState(() {
        nameController.text = profile['name'];
        phoneController.text = profile['phone'];
        homeController.text = profile['home'];
        carNumController.text = profile['carNum'];
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
