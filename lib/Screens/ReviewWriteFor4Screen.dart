import 'dart:convert';

import 'package:aisl_carpool_front/Data/Carpool.dart';
import 'package:aisl_carpool_front/Data/WaitList.dart';
import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ReviewWriteFor4Screen extends StatefulWidget {
  final Carpool carpool;

  ReviewWriteFor4Screen({required this.carpool});
  _ReviewWriteFor4Screen createState() => _ReviewWriteFor4Screen();
}

class _ReviewWriteFor4Screen extends State<ReviewWriteFor4Screen> {
  late Future<List<WaitList>> futureWaitData;
  late String userEmail;
  late List<int> selectedButton;
  final List<TextEditingController>? reviewControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void initState() {
    super.initState();
    futureWaitData = fetchWaitData(widget.carpool.carpoolNum);
    userEmail = '';
    selectedButton = List.filled(4, 0);
  }

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
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 400,
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 12, color: Color(0xFF000000)),
                      child: Text(
                        '상대방에 대한 악의적인 비방 내용은 리뷰 작성시 불이익이 발생할 수 있습니다.',
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<WaitList>>(
                      future: futureWaitData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext ctx, int idx) {
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 350,
                                  padding: EdgeInsets.only(
                                      bottom: 25, left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF9EA1CA),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 10, top: 20),
                                        child: DefaultTextStyle(
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF000000),
                                          ),
                                          child:
                                              Text(snapshot.data![idx].guest),
                                        ),
                                      ),
                                      Container(
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                print(
                                                    '${idx} : ${selectedButton[idx]}');
                                                setState(() {
                                                  if (selectedButton[idx] ==
                                                      1) {
                                                    selectedButton[idx] = 0;
                                                  } else {
                                                    selectedButton[idx] = 1;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                selectedButton[idx] == 0
                                                    ? Icons.star_border
                                                    : Icons.star,
                                                color: Color(0xFF9EA1CA),
                                              ),
                                              iconSize: 25,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                print(
                                                    '${idx} : ${selectedButton[idx]}');
                                                setState(() {
                                                  if (selectedButton[idx] ==
                                                      2) {
                                                    selectedButton[idx] = 0;
                                                  } else {
                                                    selectedButton[idx] = 2;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                selectedButton[idx] == 0 ||
                                                        selectedButton[idx] == 1
                                                    ? Icons.star_border
                                                    : Icons.star,
                                                color: Color(0xFF9EA1CA),
                                              ),
                                              iconSize: 25,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                print(
                                                    '${idx} : ${selectedButton[idx]}');
                                                setState(() {
                                                  if (selectedButton[idx] ==
                                                      3) {
                                                    selectedButton[idx] = 0;
                                                  } else {
                                                    selectedButton[idx] = 3;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                selectedButton[idx] == 5 ||
                                                        selectedButton[idx] ==
                                                            4 ||
                                                        selectedButton[idx] == 3
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color: Color(0xFF9EA1CA),
                                              ),
                                              iconSize: 25,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                print(
                                                    '${idx} : ${selectedButton[idx]}');
                                                setState(() {
                                                  if (selectedButton[idx] ==
                                                      4) {
                                                    selectedButton[idx] = 0;
                                                  } else {
                                                    selectedButton[idx] = 4;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                selectedButton[idx] == 5 ||
                                                        selectedButton[idx] == 4
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color: Color(0xFF9EA1CA),
                                              ),
                                              iconSize: 25,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                print(
                                                    '${idx} : ${selectedButton[idx]}');
                                                setState(() {
                                                  if (selectedButton[idx] ==
                                                      5) {
                                                    selectedButton[idx] = 0;
                                                  } else {
                                                    selectedButton[idx] = 5;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                selectedButton[idx] == 5
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color: Color(0xFF9EA1CA),
                                              ),
                                              iconSize: 25,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 300,
                                        height: 120,
                                        child: TextFormField(
                                          controller: reviewControllers?[idx],
                                          decoration: InputDecoration(
                                              hintText: "여기에 리뷰를 작성해주세요",
                                              border: InputBorder.none),
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xffC1BDDA),
                                                side: BorderSide(
                                                    width: 1.0,
                                                    color: Color(0xffC1BDDA)),
                                              ),
                                              child: DefaultTextStyle(
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF000000)),
                                                child: Text('작성하기'),
                                              ),
                                              onPressed: () {
                                                reviewWrite(
                                                    widget.carpool.carpoolNum,
                                                    snapshot.data![idx].waitNum,
                                                    selectedButton[idx],
                                                    reviewControllers![idx]
                                                        .text);
                                              },
                                            ),
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
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF000000)),
                            child: Text('메인화면'),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      StartScreen(),
                                ),
                                (context) => false);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<List<WaitList>> fetchWaitData(int carpoolNum) async {
    var token = await getToken();
    final response = await http.get(
      Uri.parse(
          "${dotenv.env['API_URL']}:8080/carpool/${carpoolNum}/apply-listAll"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => WaitList.fromJson(item)).toList();
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
        'Content-Type': 'application/json; charset=UTF-8',
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

  void reviewWrite(int carpoolNum, int waitNum, int star, String review) async {
    var token = await getToken();
    print("${star} ${review} ${carpoolNum} ${waitNum}");
    var url = Uri.parse(
        "${dotenv.env['API_URL']}:8080/carpool/${carpoolNum}/wait/${waitNum}/guest/reviewed");
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
                title: Text('리뷰 작성 실패'),
                content: Text('리뷰 작성에 실패하셨습니다.'),
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
