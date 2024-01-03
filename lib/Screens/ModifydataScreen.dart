import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModifydataScreen extends StatefulWidget {
  ModifydataScreen({Key? key}) : super(key: key);
  @override
  _ModifydataScreenState createState() => _ModifydataScreenState();
}

class _ModifydataScreenState extends State<ModifydataScreen> {
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
          backgroundColor: Color(0xffB9BADA),
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
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF9EA1CA)),
                      child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF000000)),
                          child: Text('이름')),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 30,
                      width: 300,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF9EA1CA)))),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF9EA1CA)),
                      child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF000000)),
                          child: Text('전화번호')),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 30,
                      width: 300,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF9EA1CA)))),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF9EA1CA)),
                      child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF000000)),
                          child: Text('주소')),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 30,
                      width: 300,
                      child: TextField(
                        controller: homeController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF9EA1CA)))),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF9EA1CA)),
                      child: DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF000000)),
                          child: Text('차량번호')),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 30,
                      width: 300,
                      child: TextField(
                        controller: carNumController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF9EA1CA)))),
                      ),
                    ),
                  ],
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
                            TextStyle(fontSize: 15, color: Color(0xFF000000)),
                        child: Text('수정하기')),
                    onPressed: () {
                      profileUpdate(nameController.text, phoneController.text,
                          homeController.text, carNumController.text, context);
                    },
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void profileUpdate(String name, String phone, String home, String carNum,
      BuildContext context) async {
    var token = await getToken();
    var url = Uri.parse("${dotenv.env['API_URL']}:8080/myprofile/update");
    var response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone': phone,
        'home': home,
        'carNum': carNum
      }),
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyPageScreen()),
      );
    }
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
        carNumController.text = profile['carNum'] ?? '';
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
