import 'package:aisl_carpool_front/Data/User.dart';
import 'package:aisl_carpool_front/Screens/CarpoolResultListScreen.dart';
import 'package:aisl_carpool_front/Screens/CarpoolScreen.dart';
import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:aisl_carpool_front/Screens/PostDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Data/Carpool.dart';
import 'CarpoolListScreen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late Future<List<Carpool>> futureCarpoolData;
  late String userEmail;
  String selectedButton = '등록순';

  @override
  void initState() {
    super.initState();
    futureCarpoolData = fetchCarpoolDataByTime();
    userEmail = '';
    fetchUserEmail();
  }

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
              leading: FutureBuilder<int>(
                future: fetchUserStatus(),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData && snapshot.data == 1) {
                    return IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
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
                        Navigator.of(context).push(
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
            body: SafeArea(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 10, top: 10),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: selectedButton == '등록순'
                                    ? Color(0xFF9EA1CA)
                                    : Color(0xFF),
                                side: BorderSide(
                                    width: 1.0, color: Color(0xFF9EA1CA)),
                              ),
                              child: Text(
                                '등록순',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  futureCarpoolData = fetchCarpoolDataByTime();
                                  fetchUserEmail();
                                  selectedButton = '등록순';
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 10, top: 10),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: selectedButton == '출발시간순'
                                    ? Color(0xFF9EA1CA)
                                    : Color(0xFF),
                                side: BorderSide(
                                    width: 1.0, color: Color(0xFF9EA1CA)),
                              ),
                              child: Text(
                                '출발시간순',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  futureCarpoolData = fetchCarpoolDataByDate();
                                  fetchUserEmail();
                                  selectedButton = '출발시간순';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: FutureBuilder<List<Carpool>>(
                          future: futureCarpoolData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var carpools = snapshot.data!;
                              return RefreshIndicator(child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext ctx, int idx) {
                                  int reversedIdx = snapshot.data!.length - 1 - idx;
                                  return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    PostDetailScreen(
                                                        carpool:
                                                        carpools[reversedIdx])),
                                          );
                                        },
                                        child: (snapshot.data![reversedIdx].email ==
                                            userEmail)
                                            ? Container(
                                          height: 200,
                                          padding: EdgeInsets.only(
                                              bottom: 25,
                                              left: 15,
                                              right: 15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF9EA1CA),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    // SizedBox(
                                                    //   width: 50,
                                                    //   height: 40,
                                                    //   child: TextButton(
                                                    //     child: (DefaultTextStyle(
                                                    //         style: TextStyle(
                                                    //             fontSize: 13,
                                                    //             color: Color(
                                                    //                 0xFF9EA1CA)),
                                                    //         child: Text('수정'))),
                                                    //     onPressed: () {},
                                                    //   ),
                                                    // ),
                                                    // Container(
                                                    //   padding: EdgeInsets.only(
                                                    //       bottom: 5),
                                                    //   child: DefaultTextStyle(
                                                    //       style: TextStyle(
                                                    //           fontSize: 20,
                                                    //           color: Color(
                                                    //               0xFF9EA1CA)),
                                                    //       child: Text('|')),
                                                    // ),
                                                    SizedBox(
                                                      width: 50,
                                                      height: 40,
                                                      child: TextButton(
                                                        child: (DefaultTextStyle(
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xFF9EA1CA)),
                                                            child:
                                                            Text('삭제'))),
                                                        onPressed: () {
                                                          showDialog(
                                                              context:
                                                              context,
                                                              builder:
                                                                  (BuildContext
                                                              context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '게시물 삭제'),
                                                                  content: Text(
                                                                      '해당 게시물을 삭제하시겠습니까?'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        // '아니요' 버튼을 눌렀을 때 수행할 동작
                                                                        Navigator.of(context)
                                                                            .pop(); // AlertDialog를 닫음
                                                                      },
                                                                      child: Text(
                                                                          '아니요'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        delete(
                                                                            carpools[reversedIdx].carpoolNum);
                                                                      },
                                                                      child: Text(
                                                                          '예'),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                bottom: 10,
                                                                top: 10),
                                                            child:
                                                            DefaultTextStyle(
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color(
                                                                      0xFF000000)),
                                                              child: Text('경로정보'),
                                                            ),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    10),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '출발')),
                                                              ),
                                                              Container(
                                                                width: 70,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(snapshot
                                                                        .data![
                                                                    reversedIdx]
                                                                        .start)),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                bottom: 10,
                                                                left: 25),
                                                            child:
                                                            DefaultTextStyle(
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color(
                                                                      0xFF000000)),
                                                              child: Text('↓'),
                                                            ),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '도착')),
                                                              ),
                                                              Container(
                                                                width: 70,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(snapshot
                                                                        .data![
                                                                    reversedIdx]
                                                                        .end)),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                bottom: 10,
                                                                top: 9),
                                                            child: DefaultTextStyle(
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    color: Color(
                                                                        0xFF000000)),
                                                                child: Text(
                                                                    '카풀 세부 정보') //Text(nameController.text),
                                                            ),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    10),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '날짜')),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child:
                                                                DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13,
                                                                      color: Color(
                                                                          0xFF000000)),
                                                                  child: Text(DateFormat(
                                                                      'yyyy.MM.dd')
                                                                      .format(DateTime.parse(snapshot
                                                                      .data![
                                                                  reversedIdx]
                                                                      .date))),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    10),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '시간')),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child:
                                                                DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13,
                                                                      color: Color(
                                                                          0xFF000000)),
                                                                  child: Text(DateFormat(
                                                                      'HH:mm')
                                                                      .format(DateTime.parse(snapshot
                                                                      .data![
                                                                  reversedIdx]
                                                                      .date))),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '인원')),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child:
                                                                DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13,
                                                                      color: Color(
                                                                          0xFF000000)),
                                                                  child: Text(
                                                                      '${snapshot.data![reversedIdx].memberNum}명'),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                            : Container(
                                          height: 200,
                                          padding: EdgeInsets.only(
                                            bottom: 25,
                                            left: 15,
                                            right: 15,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF9EA1CA),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                        width: 50,
                                                        height: 40,
                                                        child: Container()),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                bottom: 10,
                                                                top: 10),
                                                            child:
                                                            DefaultTextStyle(
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color(
                                                                      0xFF000000)),
                                                              child: Text('경로정보'),
                                                            ),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    10),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '출발')),
                                                              ),
                                                              Container(
                                                                width: 70,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(snapshot
                                                                        .data![
                                                                    reversedIdx]
                                                                        .start)),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                bottom: 10,
                                                                left: 25),
                                                            child:
                                                            DefaultTextStyle(
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color(
                                                                      0xFF000000)),
                                                              child: Text('↓'),
                                                            ),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '도착')),
                                                              ),
                                                              Container(
                                                                width: 70,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(snapshot
                                                                        .data![
                                                                    reversedIdx]
                                                                        .end)),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                bottom: 10,
                                                                top: 9),
                                                            child: DefaultTextStyle(
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    color: Color(
                                                                        0xFF000000)),
                                                                child: Text(
                                                                    '카풀 세부 정보') //Text(nameController.text),
                                                            ),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    10),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '날짜')),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child:
                                                                DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13,
                                                                      color: Color(
                                                                          0xFF000000)),
                                                                  child: Text(DateFormat(
                                                                      'yyyy.MM.dd')
                                                                      .format(DateTime.parse(snapshot
                                                                      .data![
                                                                  reversedIdx]
                                                                      .date))),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    10),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '시간')),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child:
                                                                DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13,
                                                                      color: Color(
                                                                          0xFF000000)),
                                                                  child: Text(DateFormat(
                                                                      'HH:mm')
                                                                      .format(DateTime.parse(snapshot
                                                                      .data![
                                                                  reversedIdx]
                                                                      .date))),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 60,
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    color: Color(
                                                                        0xFF9EA1CA)),
                                                                child: DefaultTextStyle(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        13,
                                                                        color: Color(
                                                                            0xFF000000)),
                                                                    child: Text(
                                                                        '인원')),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    left: 10),
                                                                child:
                                                                DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13,
                                                                      color: Color(
                                                                          0xFF000000)),
                                                                  child: Text(
                                                                      '${snapshot.data![reversedIdx].memberNum}명'),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              ), onRefresh: ()async{
                                setState(() {
                                  futureCarpoolData = fetchCarpoolDataByTime();
                                });
                              });

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
        ));
  }

  Future<List<Carpool>> fetchCarpoolDataByTime() async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse("${dotenv.env['API_URL']}:8080/main"),
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
      Uri.parse("${dotenv.env['API_URL']}:8080/main"),
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

  void delete(int carpoolNum) async {
    print("카풀 num 확인 : ${carpoolNum}");
    var token = await getToken();
    var url =
    Uri.parse("${dotenv.env['API_URL']}:8080/carpool/delete/${carpoolNum}");
    var response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('게시물 삭제 완료'),
                content: Text('게시물 삭제가 완료되었습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => StartScreen()),
                        );
                      },
                      child: Text('확인'))
                ]);
          });
    } else if (response.statusCode == 403) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('게시물 삭제 실패'),
                content: Text('출발 12시간 전에는 삭제할 수 없습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('게시물 삭제 실패'),
                content: Text('게시물 삭제에 실패하셨습니다.'),
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
