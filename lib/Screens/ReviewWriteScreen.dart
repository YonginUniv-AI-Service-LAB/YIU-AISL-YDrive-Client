import 'dart:convert';

import 'package:aisl_carpool_front/Data/Carpool.dart';
import 'package:aisl_carpool_front/Data/WaitList.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'MyPageScreen.dart';

class ReviewWriteScreen extends StatefulWidget {
  final int carpoolNum;
  final int waitNum;

  ReviewWriteScreen({required this.carpoolNum, required this.waitNum});
  _ReviewWriteScreen createState() => _ReviewWriteScreen();
}

class _ReviewWriteScreen extends State<ReviewWriteScreen> {
  int selectedButton = 0;
  final reviewController = TextEditingController();
  late String userEmail;

  void initState() {
    super.initState();
    fetchUserEmail();
    userEmail = '';
    fetchWaitListData(widget.carpoolNum);
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
              Icons.list,
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (selectedButton == 1) {
                                selectedButton = 0;
                              } else {
                                selectedButton = 1;
                              }
                            });
                          },
                          icon: Icon(
                            selectedButton == 0
                                ? Icons.star_border
                                : Icons.star,
                            color: Color(0xFF9EA1CA),
                          ),
                          iconSize: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (selectedButton == 2) {
                                selectedButton = 0;
                              } else {
                                selectedButton = 2;
                              }
                            });
                          },
                          icon: Icon(
                            selectedButton == 0 || selectedButton == 1
                                ? Icons.star_border
                                : Icons.star,
                            color: Color(0xFF9EA1CA),
                          ),
                          iconSize: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (selectedButton == 3) {
                                selectedButton = 0;
                              } else {
                                selectedButton = 3;
                              }
                            });
                          },
                          icon: Icon(
                            selectedButton == 5 ||
                                    selectedButton == 4 ||
                                    selectedButton == 3
                                ? Icons.star
                                : Icons.star_border,
                            color: Color(0xFF9EA1CA),
                          ),
                          iconSize: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (selectedButton == 4) {
                                selectedButton = 0;
                              } else {
                                selectedButton = 4;
                              }
                            });
                          },
                          icon: Icon(
                            selectedButton == 5 || selectedButton == 4
                                ? Icons.star
                                : Icons.star_border,
                            color: Color(0xFF9EA1CA),
                          ),
                          iconSize: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (selectedButton == 5) {
                                selectedButton = 0;
                              } else {
                                selectedButton = 5;
                              }
                            });
                          },
                          icon: Icon(
                            selectedButton == 5
                                ? Icons.star
                                : Icons.star_border,
                            color: Color(0xFF9EA1CA),
                          ),
                          iconSize: 25,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 30),
                    child: Container(
                        height: 300,
                        width: 400,
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF9EA1CA),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 330,
                              height: 200,
                              child: TextFormField(
                                controller: reviewController,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 400,
                    child: DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF000000)),
                        child: Text(
                            '상대방에 대한 악의적인 비방 내용은 리뷰 작성시 불이익이 발생할 수 있습니다.')),
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
                                child: Text('메인화면'))),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        StartScreen()), (context) => false
                              );
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
                                child: Text('작성하기'))),
                            onPressed: () {
                              reviewWrite(widget.carpoolNum, widget.waitNum,
                                  selectedButton, reviewController.text);
                            },
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  void reviewWrite(int carpoolNum, int waitNum, int star, String review) async {
    print("${carpoolNum} ${waitNum} ${star} ${review}");
    var token = await getToken();
    var url = Uri.parse(
        "${dotenv.env['API_URL']}:8080/carpool/${carpoolNum}/wait/${waitNum}/owner/reviewed");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'star': star,
          'review': review,
        }));
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('리뷰 작성 완료'),
                content: Text('리뷰 작성이 완료되었습니다.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => StartScreen()), (context) => false
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
                title: Text('리뷰 작성 실패'),
                content: Text('별점이나 리뷰가 입력되지 않았습니다.\n별점과 리뷰를 모두 작성해주세요.'),
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

  Future<int> fetchWaitListData(int carpoolNum) async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse(
          "${dotenv.env['API_URL']}:8080/carpool/${carpoolNum}/apply-listAll"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var filteredList = jsonResponse
          .map((item) => WaitList.fromJson(item))
          .where((waitList) => waitList.guest == userEmail)
          .toList();
      return filteredList.first.waitNum;
    } else {
      throw Exception('Failed to load carpool data');
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
