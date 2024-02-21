import 'package:aisl_carpool_front/Data/UseList.dart';
import 'package:aisl_carpool_front/Screens/CarpoolListScreen.dart';
import 'package:aisl_carpool_front/Screens/ModifydataScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'CarpoolResultListScreen.dart';

class MyPageScreen extends StatefulWidget {
  MyPageScreen({Key? key}) : super(key: key);

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  late Future<List<UseList>> futureUseListData;
  Future<int>? futureStatus;
  String selectedButton = '차주';

  void initState() {
    super.initState();
    fetchProfile();
    futureStatus = fetchUserStatus();
    futureUseListData = fetchOwnerList();
  }

  void refreshStatus() {
    setState(() {
      futureStatus = fetchUserStatus();
    });
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final homeController = TextEditingController();
  final carNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE6E1EF),
          leading: FutureBuilder<int>(
            future: fetchUserStatus(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData && snapshot.data == 1) {
                return IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CarpoolListScreen()),
                    );
                  },
                  icon: Icon(color: Color(0xFF9EA1CA), Icons.list),
                  iconSize: 40,
                );
              } else {
                return IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CarpoolResultListScreen()),
                    );
                  },
                  icon: Icon(color: Color(0xFF9EA1CA), Icons.list),
                  iconSize: 40,
                );
              }
            },
          ),
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => StartScreen()),(route) => false
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
        body: SafeArea(
          child: Container(
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 130,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF9EA1CA),
                            side: BorderSide(
                                width: 1.0, color: Color(0xFF9EA1CA)),
                          ),
                          child: (Text(
                            '수정하기',
                            style: TextStyle(color: Color(0xFF000000)),
                          )),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
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
                            side: BorderSide(
                                width: 1.0, color: Color(0xFF9EA1CA)),
                          ),
                          child: FutureBuilder<int>(
                            future:
                                futureStatus, // fetchUserStatus 함수를 Future로 사용
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              // 데이터가 아직 준비되지 않았을 때
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(); // 로딩 인디케이터 표시
                              } else {
                                if (snapshot.hasError)
                                  return Text('Error: ${snapshot.error}');
                                else
                                  return Text(snapshot.data == 1
                                      ? '탑승자로 전환'
                                      : '차주로 전환'); // 데이터에 따라 텍스트 변경
                              }
                            },
                          ),
                          onPressed: () async {
                            int status = await futureStatus!;
                            if (status == 1) {
                              await changeGuestMode();
                            } else {
                              await changeOwnerMode();
                            }
                            refreshStatus();
                          },
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
                        width: 90,
                        margin: EdgeInsets.only(left: 30),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: selectedButton == '차주'
                                ? Color(0xFF9EA1CA)
                                : Color(0xFF),
                            side: BorderSide(
                                width: 1.0, color: Color(0xFF9EA1CA)),
                          ),
                          child: (Text(
                            '차주',
                            style: TextStyle(
                                color: Color(0xFF000000), fontSize: 15),
                          )),
                          onPressed: () {
                            setState(() {
                              futureUseListData = fetchOwnerList();
                              selectedButton = '차주';
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 90,
                        margin: EdgeInsets.only(left: 10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: selectedButton == '탑승자'
                                ? Color(0xFF9EA1CA)
                                : Color(0xFF),
                            side: BorderSide(
                                width: 1.0, color: Color(0xFF9EA1CA)),
                          ),
                          child: (Text(
                            '탑승자',
                            style: TextStyle(
                                color: Color(0xFF000000), fontSize: 15),
                          )),
                          onPressed: () {
                            setState(() {
                              futureUseListData = fetchGuestList();
                              selectedButton = '탑승자';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: FutureBuilder<List<UseList>>(
                  future: futureUseListData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          int reversedIdx = snapshot.data!.length - 1 - idx;
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        color:
                                                            Color(0xFF000000)),
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
                                                        color:
                                                            Color(0xFF000000)),
                                                    child: Text(DateFormat(
                                                            'yyyy-MM-dd')
                                                        .format(DateTime.parse(
                                                            snapshot
                                                                .data![
                                                                    reversedIdx]
                                                                .date))),
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
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
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
                                              margin: EdgeInsets.only(
                                                  top: 3, left: 10),
                                              child: DefaultTextStyle(
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xFF000000)),
                                                  child: Text(snapshot
                                                      .data![reversedIdx]
                                                      .start)),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 10, left: 25),
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
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
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
                                              margin: EdgeInsets.only(
                                                  top: 3, left: 10),
                                              child: DefaultTextStyle(
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xFF000000)),
                                                  child: Text(snapshot
                                                      .data![reversedIdx].end)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                ))
              ],
            ),
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

  Future<List<UseList>> fetchOwnerList() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse("${dotenv.env['API_URL']}:8080/list/owner"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        throw Exception('이용 내역이 없습니다.');
      } else {
        return jsonResponse.map((item) => UseList.fromJson(item)).toList();
      }
    } else {
      throw Exception('Failed to load ownerReviewed Data');
    }
  }

  Future<List<UseList>> fetchGuestList() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse("${dotenv.env['API_URL']}:8080/list/guest"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        throw Exception('이용 내역이 없습니다.');
      } else {
        return jsonResponse.map((item) => UseList.fromJson(item)).toList();
      }
    } else {
      throw Exception('Failed to load ownerReviewed Data');
    }
  }

  Future<void> changeOwnerMode() async {
    var token = await getToken();
    final response = await http.put(
      Uri.parse("${dotenv.env['API_URL']}:8080/myprofile/ownerMode"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('차주 모드 전환 완료'),
              content: Text('차주 모드로 전환이 완료되었습니다.'),
              actions: <Widget>[
                TextButton(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else if (response.statusCode == 404) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('모드 전환 불가'),
              content: Text('등록된 차량이 존재하지 않아 탑승자 모드 전환이 불가합니다.'),
              actions: <Widget>[
                TextButton(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  Future<void> changeGuestMode() async {
    var token = await getToken();
    final response = await http.put(
      Uri.parse("${dotenv.env['API_URL']}:8080/myprofile/guestMode"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('탑승자 모드 전환 완료'),
              content: Text('탑승자 모드로 전환이 완료되었습니다.'),
              actions: <Widget>[
                TextButton(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  Future<int> fetchUserStatus() async {
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
      int status = jsonResponse['state']; // API 응답에서 status 값을 가져옵니다
      return status;
    } else {
      throw Exception('Failed to fetch user status');
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
