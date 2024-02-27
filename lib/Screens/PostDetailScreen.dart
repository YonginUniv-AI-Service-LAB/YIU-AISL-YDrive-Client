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

import '../Data/Review.dart';
import 'CarpoolListScreen.dart';
import 'CarpoolResultListScreen.dart';

class PostDetailScreen extends StatefulWidget {
  final Carpool carpool;

  PostDetailScreen({required this.carpool});
  _PostDetailScreen createState() => _PostDetailScreen();
}

class _PostDetailScreen extends State<PostDetailScreen> {
  late Future<List<Review>> futureReviewData;

  @override
  void initState() {
    super.initState();
    futureReviewData = fetchOwnerReview(widget.carpool.email);
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
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 30),
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
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFF4d377b)),
                                          child: Text(widget.carpool.start)),
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
                                          child: Text(widget.carpool.end)),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF4d377b)),
                                      child: Text(
                                          DateFormat('yyyy년 MM월 dd일 HH:mm')
                                              .format(DateTime.parse(
                                                  widget.carpool.date)))),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF4d377b)),
                                      child: Text(
                                          '남은 인원 : ${widget.carpool.memberNum}명')),
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
                  child: FutureBuilder<List<Review>>(
                    future: futureReviewData,
                    builder: (context, AsyncSnapshot<List<Review>> snapshot) {
                      if (snapshot.hasData) {
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
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            snapshot.data![idx].star >= 1
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Color(0xFF9EA1CA),
                                            size: 25,
                                          ),
                                          Icon(
                                            snapshot.data![idx].star >= 2
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Color(0xFF9EA1CA),
                                            size: 25,
                                          ),
                                          Icon(
                                            snapshot.data![idx].star >= 3
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Color(0xFF9EA1CA),
                                            size: 25,
                                          ),
                                          Icon(
                                            snapshot.data![idx].star >= 4
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Color(0xFF9EA1CA),
                                            size: 25,
                                          ),
                                          Icon(
                                            snapshot.data![idx].star >= 5
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Color(0xFF9EA1CA),
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            DefaultTextStyle(
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFF4d377b),
                                              ),
                                              child: Expanded(
                                                child: Text(
                                                    snapshot.data![idx].review),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xffC1BDDA),
                        side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                      ),
                      child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF000000)),
                          child: Text('신청하기')),
                      onPressed: () {
                        applyCarpool(context, widget.carpool.carpoolNum,
                            widget.carpool.email);
                      },
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> applyCarpool(
      BuildContext context, int carpoolNum, String email) async {
    final String token = await getToken();
    final String url =
        "${dotenv.env['API_URL']}:8080/carpool/apply/${carpoolNum}";
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
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    StartScreen()),
                            (context) => false);
                      },
                      child: Text('확인'))
                ]);
          });
    } else if (response.statusCode == 401) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('신청 마감'),
                content: Text('해당 카풀은 신청이 마감되었습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
      print("실패함");
    } else if (response.statusCode == 402) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('신청 마감'),
                content: Text('해당 카풀은 신청이 마감되었습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
      print("실패함");
    } else if (response.statusCode == 403) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('이미 신청한 카풀'),
                content: Text('이미 신청한 카풀입니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
      print("실패함");
    } else if (response.statusCode == 405) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('본인이 작성한 게시물'),
                content: Text('본인이 작성한 게시물입니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'))
                ]);
          });
      print("실패함");
    }
  }

  Future<List<Review>> fetchOwnerReview(String email) async {
    try {
      var token = await getToken();
      final response = await http.get(
        Uri.parse(
            "${dotenv.env['API_URL']}:8080/list/review/owner/${email}"),

        headers: <String, String>{
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
      print('Error in fetchOwnerReview: $e');
      throw Exception('Failed to load carpool data');
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
