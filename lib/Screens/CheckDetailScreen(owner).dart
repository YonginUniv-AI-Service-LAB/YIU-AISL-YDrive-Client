import 'dart:convert';

import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Data/Carpool.dart';
import 'package:aisl_carpool_front/Data/UseList.dart';
import '../Data/Review.dart';

class CheckDetailScreen_owner extends StatefulWidget {
  final Carpool carpool;
  final String email;
  final int carpoolNum;
  final int waitNum;

  CheckDetailScreen_owner(
      {required this.carpool,
      required this.email,
      required this.waitNum,
      required this.carpoolNum});

  _CheckDetailScreen_owner createState() => _CheckDetailScreen_owner();
}

class _CheckDetailScreen_owner extends State<CheckDetailScreen_owner> {
  late Future<List<Review>> futureReviewData;

  @override
  void initState() {
    super.initState();
    futureReviewData = fetchGuestReview(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE6E1EF),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => StartScreen()),
                  (context) => false);
            },
            icon: Icon(
              Icons.home,
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
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyPageScreen()),
                    (context) => false);
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
          child: SingleChildScrollView(
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
                        )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: Container(
                      padding: EdgeInsets.all(10),
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
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text(widget.email)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text(
                                          '최근 이용 내역') //Text(nameController.text),
                                      ),
                                ),
                                FutureBuilder<List<UseList>>(
                                    future: fetchGuestList(widget.email),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          physics: ClampingScrollPhysics(),
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Container(
                                                  height: 23,
                                                  width: 60,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10, right: 10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color(0xFF9EA1CA),
                                                  ),
                                                  child: Text(
                                                    '출발',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  // width: 100,
                                                  // margin: EdgeInsets
                                                  //     .only(
                                                  //     top:
                                                  //     3),
                                                  child: Text(
                                                    snapshot.data![index].start,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.black, // 검정색
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 23,
                                                  width: 60,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10, left: 10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color(0xFF9EA1CA),
                                                  ),
                                                  child: Text('도착',
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                ),
                                                Expanded(
                                                  // width: 100,
                                                  // margin:
                                                  //     EdgeInsets.only(top: 3),
                                                  child: Text(
                                                    snapshot.data![index].end,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.black, // 검정색
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }
                                      return CircularProgressIndicator();
                                    }),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: Column(
                                //         children: [
                                //           Row(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               Container(
                                //                 height: 23,
                                //                 width: 60,
                                //                 margin:
                                //                     EdgeInsets.only(bottom: 10),
                                //                 alignment: Alignment.center,
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             10),
                                //                     color: Color(0xFF9EA1CA)),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child: Text('출발')),
                                //               ),
                                //               Container(
                                //                 width: 100,
                                //                 margin: EdgeInsets.only(
                                //                     top: 3, left: 10),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child:
                                //                         Text('아시아드경기장(공촌사거리)')),
                                //               ),
                                //             ],
                                //           ),
                                //           Row(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               Container(
                                //                 height: 23,
                                //                 width: 60,
                                //                 margin:
                                //                     EdgeInsets.only(bottom: 10),
                                //                 alignment: Alignment.center,
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             10),
                                //                     color: Color(0xFF9EA1CA)),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child: Text('출발')),
                                //               ),
                                //               Container(
                                //                 width: 90,
                                //                 margin: EdgeInsets.only(
                                //                     top: 3, left: 10),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child: Text('신논현역')),
                                //               ),
                                //             ],
                                //           ),
                                //           Row(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               Container(
                                //                 height: 23,
                                //                 width: 60,
                                //                 margin:
                                //                     EdgeInsets.only(bottom: 10),
                                //                 alignment: Alignment.center,
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             10),
                                //                     color: Color(0xFF9EA1CA)),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child: Text('도착')),
                                //               ),
                                //               Container(
                                //                 width: 90,
                                //                 margin: EdgeInsets.only(
                                //                     top: 3, left: 10),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child: Text('용인대')),
                                //               ),
                                //             ],
                                //           ),
                                //           Row(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               Container(
                                //                 height: 23,
                                //                 width: 60,
                                //                 margin:
                                //                     EdgeInsets.only(bottom: 10),
                                //                 alignment: Alignment.center,
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             10),
                                //                     color: Color(0xFF9EA1CA)),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child: Text('출발')),
                                //               ),
                                //               Container(
                                //                 width: 100,
                                //                 margin: EdgeInsets.only(
                                //                     top: 3, left: 10),
                                //                 child: DefaultTextStyle(
                                //                     style: TextStyle(
                                //                         fontSize: 13,
                                //                         color:
                                //                             Color(0xFF000000)),
                                //                     child: Text('용인대')),
                                //               ),
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Expanded(
                                //         child: Column(
                                //       children: [
                                //         Row(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Container(
                                //               height: 23,
                                //               width: 60,
                                //               margin:
                                //                   EdgeInsets.only(bottom: 10),
                                //               alignment: Alignment.center,
                                //               decoration: BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.circular(10),
                                //                   color: Color(0xFF9EA1CA)),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child: Text('도착')),
                                //             ),
                                //             Container(
                                //               width: 100,
                                //               margin: EdgeInsets.only(
                                //                   top: 3, left: 10),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child: Text('용인대')),
                                //             ),
                                //           ],
                                //         ),
                                //         Row(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Container(
                                //               height: 23,
                                //               width: 60,
                                //               margin:
                                //                   EdgeInsets.only(bottom: 10),
                                //               alignment: Alignment.center,
                                //               decoration: BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.circular(10),
                                //                   color: Color(0xFF9EA1CA)),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child: Text('도착')),
                                //             ),
                                //             Container(
                                //               width: 100,
                                //               margin: EdgeInsets.only(
                                //                   top: 3, left: 10),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child: Text('용인대')),
                                //             ),
                                //           ],
                                //         ),
                                //         Row(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Container(
                                //               height: 23,
                                //               width: 60,
                                //               margin:
                                //                   EdgeInsets.only(bottom: 10),
                                //               alignment: Alignment.center,
                                //               decoration: BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.circular(10),
                                //                   color: Color(0xFF9EA1CA)),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child: Text('도착')),
                                //             ),
                                //             Container(
                                //               width: 100,
                                //               margin: EdgeInsets.only(
                                //                   top: 3, left: 10),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child:
                                //                       Text('아시아드경기장(공촌사거리)')),
                                //             ),
                                //           ],
                                //         ),
                                //         Row(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Container(
                                //               height: 23,
                                //               width: 60,
                                //               margin:
                                //                   EdgeInsets.only(bottom: 10),
                                //               alignment: Alignment.center,
                                //               decoration: BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.circular(10),
                                //                   color: Color(0xFF9EA1CA)),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child: Text('도착')),
                                //             ),
                                //             Container(
                                //               width: 100,
                                //               margin: EdgeInsets.only(
                                //                   top: 3, left: 10),
                                //               child: DefaultTextStyle(
                                //                   style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: Color(0xFF000000)),
                                //                   child: Text('용인대')),
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     ))
                                //   ],
                                // )
                              ],
                            )),
                      )),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xffC1BDDA),
                            side: BorderSide(
                                width: 1.0, color: Color(0xffC1BDDA)),
                          ),
                          child: (DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF000000)),
                              child: Text('거절하기'))),
                          onPressed: () {
                            deny(widget.waitNum, widget.carpoolNum, context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xffC1BDDA),
                            side: BorderSide(
                                width: 1.0, color: Color(0xffC1BDDA)),
                          ),
                          child: (DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF000000)),
                              child: Text('수락하기'))),
                          onPressed: () {
                            accept(widget.waitNum, widget.carpoolNum, context);
                          },
                        ),
                      ),
                    ]),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 5),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFF9EA1CA)),
                          child: Text('탑승자 Review'),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<Review>>(
                  future: futureReviewData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: 350,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFF9EA1CA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: snapshot.data![idx].star >= 1
                                            ? Color(0xFF4d377b)
                                            : Color(0xFFffffff),
                                        size: 25,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: snapshot.data![idx].star >= 2
                                            ? Color(0xFF4d377b)
                                            : Color(0xFFffffff),
                                        size: 25,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: snapshot.data![idx].star >= 3
                                            ? Color(0xFF4d377b)
                                            : Color(0xFFffffff),
                                        size: 25,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: snapshot.data![idx].star >= 4
                                            ? Color(0xFF4d377b)
                                            : Color(0xFFffffff),
                                        size: 25,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: snapshot.data![idx].star == 5
                                            ? Color(0xFF4d377b)
                                            : Color(0xFFffffff),
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF4d377b),
                                        ),
                                        child: Text(snapshot.data![idx].review),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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

                // ListView.builder(
                //   shrinkWrap: true,
                //   primary: false,
                //   padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                //   itemCount: 7,
                //   itemBuilder: (BuildContext ctx, int idx) {
                //     return Padding(
                //       padding: EdgeInsets.only(bottom: 10),
                //       child: Container(
                //           padding: EdgeInsets.all(10),
                //           decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: Color(0xFF9EA1CA),
                //               ),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Container(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Row(
                //                   children: [
                //                     IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.star,
                //                         color: Color(0xFF9EA1CA),
                //                       ),
                //                       iconSize: 25,
                //                     ),
                //                     IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.star,
                //                         color: Color(0xFF9EA1CA),
                //                       ),
                //                       iconSize: 25,
                //                     ),
                //                     IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.star,
                //                         color: Color(0xFF9EA1CA),
                //                       ),
                //                       iconSize: 25,
                //                     ),
                //                     IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.star_border,
                //                         color: Color(0xFF9EA1CA),
                //                       ),
                //                       iconSize: 25,
                //                     ),
                //                     IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.star_border,
                //                         color: Color(0xFF9EA1CA),
                //                       ),
                //                       iconSize: 25,
                //                     )
                //                   ],
                //                 ),
                //                 Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     SizedBox(
                //                       width: 360,
                //                       child: DefaultTextStyle(
                //                         style: TextStyle(
                //                             fontSize: 17,
                //                             color: Color(0xFF000000)),
                //                         child: Text(
                //                             '탑승자 텐션이 감당이 안되서 힘들었는데 심심하지 않게 간 것 같아 되돌아보니 조아욤 날짜'),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           )),
                //     );
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deny(int waitNum, int carpoolNum, BuildContext context) async {
    var token = await getToken();
    var url = Uri.parse(
        "${dotenv.env['API_URL']}:8080/carpool/deny/${carpoolNum}/${waitNum}");
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
            title: Text('거절 완료'),
            content: Text('해당 사용자의 신청을 거절하였습니다.'),
            actions: <Widget>[
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => StartScreen()),
                      (context) => false);
                },
              ),
            ],
          );
        },
      );
    }
  }

  void accept(int waitNum, int carpoolNum, BuildContext context) async {
    var token = await getToken();
    var url = Uri.parse(
        "${dotenv.env['API_URL']}:8080/carpool/accept/${carpoolNum}/${waitNum}");
    var response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, int>{'checkNum': 1}),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('수락 완료'),
            content: Text('해당 사용자의 신청을 수락하였습니다.'),
            actions: <Widget>[
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => StartScreen()),
                      (context) => false);
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<List<Review>> fetchGuestReview(String email) async {
    try {
      var token = await getToken();
      final response = await http.get(
        Uri.parse("${dotenv.env['API_URL']}:8080/list/review/guest/${email}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Review> reviewList =
            jsonResponse.map((item) => Review.fromJson(item)).toList();
        print(reviewList);
        return reviewList;
      } else {
        throw Exception(
            'Failed to load carpool data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchGuestReview: $e');
      throw Exception('Failed to load carpool data');
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

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
