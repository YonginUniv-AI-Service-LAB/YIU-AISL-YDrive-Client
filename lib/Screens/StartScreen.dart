import 'package:aisl_carpool_front/Screens/CarpoolScreen.dart';
import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:aisl_carpool_front/Screens/PostDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Data/Carpool.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late Future<List<Carpool>> futureCarpoolData;
  String selectedButton = '등록순';

  @override
  void initState() {
    super.initState();
    futureCarpoolData = fetchCarpoolDataByTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB9BADA),
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
                      builder: (BuildContext context) => MyPageScreen()),
                );
              },
              icon: Icon(
                Icons.person,
                color: Color(0xFF9EA1CA),
              ),
              iconSize: 40,
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            futureCarpoolData = fetchCarpoolDataByTime();
                            selectedButton = '등록순';
                          });
                        },
                        child: DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 20,
                              color: selectedButton == '등록순'
                                  ? Color(0xFF000000)
                                  : Color(0xFF000000)),
                          child: Text('등록순'),
                        )),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            futureCarpoolData = fetchCarpoolDataByDate();
                            selectedButton = '출발시간순';
                          });
                        },
                        child: DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 20,
                              color: selectedButton == '출발시간순'
                                  ? Color(0xFF000000)
                                  : Color(0xFF000000)),
                          child: Text('출발시간순'),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Carpool>>(
                  future: futureCarpoolData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          int reversedIdx = snapshot.data!.length - 1 - idx;
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  // border: Border.all(
                                  //   color: Color(0xFF9EA1CA),
                                  // ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      // backgroundColor: Colors.white.withOpacity(0.5),
                                      ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            PostDetailScreen(
                                                carpool: snapshot
                                                    .data![reversedIdx]),
                                      ),
                                    );
                                    print(
                                        'start: ${snapshot.data![reversedIdx].start}, end: ${snapshot.data![reversedIdx].end}, date: ${snapshot.data![reversedIdx].date}, memberNum: ${snapshot.data![reversedIdx].memberNum}, carpoolNum: ${snapshot.data![reversedIdx].carpoolNum}, owner: ${snapshot.data![reversedIdx].email}');
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: DefaultTextStyle(
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xFF4d377b)),
                                              child: Text(snapshot
                                                  .data![reversedIdx].start),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: DefaultTextStyle(
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xFF4d377b)),
                                              child: Text(' -> '),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: DefaultTextStyle(
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xFF4d377b)),
                                              child: Text(snapshot
                                                  .data![reversedIdx].end),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFF4d377b)),
                                          child: Text(DateFormat(
                                                  'yyyy-MM-dd HH:mm')
                                              .format(DateTime.parse(
                                                  snapshot.data![idx].date))),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFF4d377b)),
                                          child: Text(
                                              '남은 인원 : ${snapshot.data![reversedIdx].memberNum}명'),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FutureBuilder<int>(
          future: fetchUserStatus(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData && snapshot.data == 1) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => CarpoolScreen()),
                  );
                },
                shape: CircleBorder(),
                child: const Icon(Icons.add),
              );
            } else {
              return Container(); // status가 1이 아닐 때는 아무것도 보이지 않게 처리
            }
          },
        ),
      ),
    );
  }

  Future<List<Carpool>> fetchCarpoolDataByTime() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse('http://172.29.65.121:8080/main'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Carpool.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load carpool data');
    }
  }

  Future<List<Carpool>> fetchCarpoolDataByDate() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse('http://172.29.65.121:8080/main'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Carpool> carpoolList =
          jsonResponse.map((item) => Carpool.fromJson(item)).toList();

      carpoolList.sort(
          (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
      return carpoolList;
    } else {
      throw Exception('Failed to load carpool data');
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

  Future<int> fetchUserStatus() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse(
          'http://172.29.65.121:8080/user/getStatus'), // 사용자 상태를 가져오는 API endpoint
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      int status = jsonResponse['state']; // API 응답에서 status 값을 가져옵니다
      return status;
    } else {
      throw Exception('Failed to fetch user status');
    }
  }
}
