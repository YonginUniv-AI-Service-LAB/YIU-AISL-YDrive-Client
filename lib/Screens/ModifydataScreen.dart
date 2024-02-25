import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const List<String> addr1List = [
  '인천광역시',
  '부천시',
  '용인시',
  '서울특별시',
  '인천광역시',
  '성남시',
  '수원시',
  '김포시',
  '남양주시',
  '고양시',
  '하남시',
  '의정부시',
  '광명시',
  '광주시',
  '이천시',
  '여주시',
  '파주시',
  '양평군',
  '구리시',
  '가평군',
  '춘천시',
  '화성시',
  '안산시',
  '시흥시',
  '과천시',
  '안양시',
  '군포시'
];
List<String> addr2List = [''];

class ModifydataScreen extends StatefulWidget {
  ModifydataScreen({Key? key}) : super(key: key);
  @override
  _ModifydataScreenState createState() => _ModifydataScreenState();
}

class _ModifydataScreenState extends State<ModifydataScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final home1Controller = TextEditingController();
  final home2Controller = TextEditingController();
  final carNumController = TextEditingController();
  String selectedAddr1 = '';
  String selectedAddr2 = '';

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
                      //padding: EdgeInsets.only(bottom: 10),
                      height: 80,
                      width: 300,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20, bottom: 20),
                            child: DropdownMenu(
                              controller: home1Controller,
                              width: 120,
                              //initialSelection: '',
                              hintText: '시 선택',

                              onSelected: (String? value) {
                                setState(() {
                                  home2Controller.text = '';
                                  setAddr1();
                                });
                                // setState(() {
                                //   selectedAddr1 = value ?? ''; // 선택된 값 업데이트

                                //   // 두 번째 Dropdown의 내용을 갱신하거나 변경하는 로직 추가
                                //   if (selectedAddr1 == '서울시') {
                                //     addr2List = [
                                //       '종로구',
                                //       '중랑구'
                                //     ]; // 서울시가 선택되었을 때의 내용
                                //   } else if (selectedAddr1 == '인천시') {
                                //     addr2List = [
                                //       '연수구',
                                //       '남동구'
                                //     ]; // 인천시가 선택되었을 때의 내용
                                //   } else {
                                //     addr2List =
                                //         []; // 다른 지역이 선택되었을 때는 빈 리스트로 초기화
                                //   }
                                //   print(selectedAddr1);
                                // });
                              },
                              dropdownMenuEntries: addr1List
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: DropdownMenu(
                              controller: home2Controller,
                              width: 120,
                              //initialSelection: '',
                              hintText: '구 선택',
                              onSelected: (String? value) {
                                // setState(() {
                                //   selectedAddr2 = value ?? ''; // 선택된 값 업데이트

                                //   if (selectedAddr2 == '종로구') {
                                //     addr3List = ['경복궁역', '안국역'];
                                //   } else if (selectedAddr2 == '중랑구') {
                                //     addr3List = ['면목역', '중랑역'];
                                //   } else if (selectedAddr2 == '연수구') {
                                //     addr3List = ['테크노파크역', '연수역'];
                                //   } else if (selectedAddr2 == '남동구') {
                                //     addr3List = ['운연역', '만수역'];
                                //   } else {
                                //     addr3List =
                                //         []; // 다른 지역이 선택되었을 때는 빈 리스트로 초기화
                                //   }
                                //   print(selectedAddr2);
                                // });
                              },
                              dropdownMenuEntries: addr2List
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
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
                            TextStyle(fontSize: 14, color: Color(0xFF000000)),
                        child: Text('수정하기')),
                    onPressed: () {
                      profileUpdate(
                          nameController.text,
                          phoneController.text,
                          home1Controller.text,
                          home2Controller.text,
                          carNumController.text,
                          context);
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

  void profileUpdate(String name, String phone, String home1, String home2,
      String carNum, BuildContext context) async {
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
        'home': "${home1} ${home2}",
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
      String homeString = profile['home'];
      List<String> parts = homeString.split(' ');
      setState(() {
        nameController.text = profile['name'];
        phoneController.text = profile['phone'];
        home1Controller.text = parts[0];
        home2Controller.text = parts[1];
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

  void setAddr1() {
    if (home1Controller.text == '인천광역시') {
      addr2List = ['계양구', '부평구', '남동구', '미추홀구', '연수구', '서구', '중구', '남구', '동구'];
    } else if (home1Controller.text == '부천시') {
      addr2List = ['원미구', '소사구', '오정구', '대야동'];
    } else if (home1Controller.text == '용인시') {
      addr2List = ['기흥구', '처인구', '수지구'];
    } else if (home1Controller.text == '서울특별시') {
      addr2List = [
        '용산구',
        '마포구',
        '강서구',
        '강북구',
        '성북구',
        '동대문구',
        '강남구',
        '서초구',
        '영등포구',
        '동작구',
        '관악구',
        '종로구',
        '중구',
        '성동구',
        '광진구',
        '송파구',
        '구로구',
        '서대문구',
        '양천구',
        '은평구',
        '노원구',
        '도봉구',
        '강동구',
        '중랑구',
        '금천구'
      ];
    } else if (home1Controller.text == '성남시') {
      addr2List = ['분당구', '수정구', '성남시', '중원구'];
    } else if (home1Controller.text == '수원시') {
      addr2List = ['영통구', '권선구', '팔달구'];
    } else if (home1Controller.text == '김포시') {
      addr2List = ['양촌읍', '구래동', '마산동', '장기동', '운양동', '북변동', '사우동', '고촌읍'];
    } else if (home1Controller.text == '남양주시') {
      addr2List = [
        '별내동',
        '오남동',
        '진접읍',
        '다산동',
        '이패동',
        '와부읍',
        '조안면',
        '퇴계원읍',
        '진건읍',
        '금곡동',
        '평내동',
        '화도읍'
      ];
    } else if (home1Controller.text == '고양시') {
      addr2List = ['덕양구', '화전동', '일산동구', '일산서구'];
    } else if (home1Controller.text == '하남시') {
      addr2List = ['망월동', '덕풍동', '창우동'];
    } else if (home1Controller.text == '의정부시') {
      addr2List = ['장암동', '신곡동', '호원동', '의정부동', '금오동', '용현동'];
    } else if (home1Controller.text == '광명시') {
      addr2List = ['철산동', '광명동'];
    } else if (home1Controller.text == '광주시') {
      addr2List = ['중대동', '역동', '초월읍', '곤지암읍'];
    } else if (home1Controller.text == '이천시') {
      addr2List = ['신둔면', '율현동', '부발읍'];
    } else if (home1Controller.text == '여주시') {
      addr2List = ['세종대왕면', '교동'];
    } else if (home1Controller.text == '파주시') {
      addr2List = ['문산읍', '서구', '야당동', '금촌동', '월롱면', '파주읍'];
    } else if (home1Controller.text == '양평군') {
      addr2List = ['지평면', '양서면', '옥천면', '양평읍', '용문면'];
    } else if (home1Controller.text == '구리시') {
      addr2List = ['인창동', '갈매동'];
    } else if (home1Controller.text == '가평군') {
      addr2List = ['청평면', '가평읍'];
    } else if (home1Controller.text == '춘천시') {
      addr2List = ['남산면', '신동면', '퇴계동', '근화동'];
    } else if (home1Controller.text == '화성시') {
      addr2List = ['매송면'];
    } else if (home1Controller.text == '안산시') {
      addr2List = ['상록구', '단원구'];
    } else if (home1Controller.text == '시흥시') {
      addr2List = ['정왕동', '월곶동', '신천동', '미산동', '광석동', '능곡동'];
    } else if (home1Controller.text == '과천시') {
      addr2List = ['과천동', '막계동', '별양동', '중앙동'];
    } else if (home1Controller.text == '안양시') {
      addr2List = ['동안구'];
    } else if (home1Controller.text == '군포시') {
      addr2List = ['산본동', '대야미동'];
    } else {
      addr2List = ['오류'];
    }
  }
}
