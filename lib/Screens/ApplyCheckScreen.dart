import 'package:aisl_carpool_front/Data/WaitList.dart';
import 'package:aisl_carpool_front/Screens/CarpoolScreen.dart';
import 'package:aisl_carpool_front/Screens/ChcekDetailWaitScreen.dart';
import 'package:aisl_carpool_front/Screens/CheckDetailScreen(owner).dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aisl_carpool_front/Data/UseList.dart';

import '../Data/Carpool.dart';
import 'CarpoolListScreen.dart';
import 'CarpoolResultListScreen.dart';
import 'MyPageScreen.dart';

class ApplyCheckScreen extends StatefulWidget {
  final Carpool carpool;

  ApplyCheckScreen({required this.carpool});

  _ApplyCheckScreen createState() => _ApplyCheckScreen();
}

class _ApplyCheckScreen extends State<ApplyCheckScreen> {
  late Future<List<WaitList>> futureWaitListData;
  late Future<List<UseList>> futureUseListData;

  @override
  void initState() {
    super.initState();
    futureWaitListData = fetchWaitListData(widget.carpool.carpoolNum);
  }

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
                Navigator.of(context).pushReplacement(
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
        body: SafeArea(
          child: Container(
            color: Colors.white,
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
                                Container(
                                  width: 70,
                                  margin: EdgeInsets.only(top: 3, left: 10),
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
                                Container(
                                  width: 70,
                                  margin: EdgeInsets.only(top: 3, left: 10),
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
                SizedBox(
                  width: 100,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xffC1BDDA),
                      side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                    ),
                    child: (DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF000000)),
                        child: Text('모집마감'))),
                    onPressed: () {
                      acceptFinish(widget.carpool.carpoolNum, context);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 5),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: DefaultTextStyle(
                      style: TextStyle(fontSize: 30, color: Color(0xFF9EA1CA)),
                      child: Text('신청자 리스트')),
                ),
                Expanded(
                    child: FutureBuilder<List<WaitList>>(
                        future: futureWaitListData,
                        builder:
                            (context, AsyncSnapshot<List<WaitList>> snapshot) {
                          if (snapshot.hasData) {
                            var carpools = snapshot.data!;
                            return ListView.builder(
                              padding:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext ctx, int idx) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xFF9EA1CA),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        CheckDetailScreen_owner(
                                                            carpool:
                                                                widget.carpool,
                                                            email: snapshot
                                                                .data![idx]
                                                                .guest,
                                                            waitNum: snapshot
                                                                .data![idx]
                                                                .waitNum,
                                                            carpoolNum: snapshot
                                                                .data![idx]
                                                                .carpoolNum)),
                                              );
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: 10,
                                                  ),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text(snapshot
                                                          .data![idx].guest)),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    bottom: 10,
                                                  ),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text(
                                                          '최근 이용 내역') //Text(nameController.text),
                                                      ),
                                                ),
                                                FutureBuilder<List<UseList>>(
                                                    future: fetchGuestList(
                                                        snapshot
                                                            .data![idx].guest),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return ListView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              ClampingScrollPhysics(),
                                                          itemCount: snapshot
                                                              .data!.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Row(
                                                              children: [
                                                                Container(
                                                                  //height: 23,
                                                                  width: 60,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Color(
                                                                        0xFF9EA1CA),
                                                                  ),
                                                                  child: Text(
                                                                    '출발',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  // width: 100,
                                                                  // margin: EdgeInsets
                                                                  //     .only(
                                                                  //         top:
                                                                  //             3),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .start,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black, // 검정색
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  //height: 23,
                                                                  width: 60,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10,
                                                                          left:
                                                                              10),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Color(
                                                                        0xFF9EA1CA),
                                                                  ),
                                                                  child: Text(
                                                                      '도착',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                                Expanded(
                                                                  // width: 100,
                                                                  // margin: EdgeInsets
                                                                  //     .only(
                                                                  //         top:
                                                                  //             3),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .end,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black, // 검정색
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return Text(
                                                            '${snapshot.error}');
                                                      }
                                                      return CircularProgressIndicator();
                                                    })
                                              ],
                                            )),
                                      )),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return CircularProgressIndicator();
                        }))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => CarpoolScreen()),
            );
          },
          shape: CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<List<WaitList>> fetchWaitListData(int carpoolNum) async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse(
          "${dotenv.env['API_URL']}:8080/carpool/${carpoolNum}/apply-list"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => WaitList.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load carpool data');
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  void acceptFinish(int carpoolNum, BuildContext context) async {
    var token = await getToken();
    var url = Uri.parse(
        "${dotenv.env['API_URL']}:8080/carpool/${carpoolNum}/acceptFinish");
    var response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, int>{'checkNum': 2}),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('모집 마감'),
            content: Text('해당 카풀의 모집을 마감하였습니다.'),
            actions: <Widget>[
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CheckDetailWaitScreen(carpool: widget.carpool)),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<List<UseList>> fetchGuestList(String email) async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse("${dotenv.env['API_URL']}:8080/list/guest/${email}"),
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
}
