import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'CarpoolListScreen.dart';
import 'MyPageScreen.dart';
import 'StartScreen.dart';

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
List<String> addr3List = [''];
List<String> addr4List = [''];
List<String> tiem1List = [
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12'
];
List<String> tiem2List = [
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31'
];
List<String> tiem3List = [
  '00',
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23'
];
List<String> tiem4List = ['00', '10', '20', '30', '40', '50'];
const List<String> numberList = ['1', '2', '3', '4'];

class CarpoolScreen extends StatefulWidget {
  CarpoolScreen({Key? key}) : super(key: key);

  _CarpoolScreenState createState() => _CarpoolScreenState();
}

class _CarpoolScreenState extends State<CarpoolScreen> {
  final addr1Controller = TextEditingController();
  final addr2Controller = TextEditingController();
  final addr3Controller = TextEditingController();
  final addr4Controller = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  final numberController = TextEditingController();
  String selectedAddr1 = '';
  String selectedAddr2 = '';
  String selectedAddr3 = '';
  String selectedAddr4 = '';
  String selectedButton = '등교';
  String selectedAddr = '용인대학교';

  bool _addr1Validate = false;
  bool _addr2Validate = false;
  bool _addr3Validate = false;
  bool _addr4Validate = false;

  bool _monthValidate = false;
  bool _dayValidate = false;
  bool _hourValidate = false;
  bool _minuteValidate = false;
  bool _numberValidate = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE6E1EF),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => CarpoolListScreen()));
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
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: selectedButton == '등교'
                                  ? Color(0xFF9EA1CA)
                                  : Color(0xFF),
                              side: BorderSide(
                                  width: 1.0, color: Color(0xFF9EA1CA)),
                            ),
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFF000000)),
                                child: Text('등교')),
                            onPressed: () {
                              setState(() {
                                selectedButton = '등교';
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(left: 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: selectedButton == '하교'
                                  ? Color(0xFF9EA1CA)
                                  : Color(0xFF),
                              side: BorderSide(
                                  width: 1.0, color: Color(0xFF9EA1CA)),
                            ),
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFF000000)),
                                child: Text('하교')),
                            onPressed: () {
                              setState(() {
                                selectedButton = '하교';
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: (selectedButton == '등교')
                        ? Container(
                            padding: EdgeInsets.only(top: 10),
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('출발지')),
                                ),
                                Container(
                                  //padding: EdgeInsets.only(bottom: 10),
                                  height: 180,
                                  width: 300,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 20, bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr1Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '시 선택',

                                              onSelected: (String? value) {
                                                setState(() {
                                                  addr2Controller.text = '';
                                                  setAddr1();
                                                });
                                              },
                                              dropdownMenuEntries: addr1List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr2Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '구 선택',
                                              onSelected: (String? value) {
                                                setState(() {
                                                  addr3Controller.text = '';
                                                  setAddr2();
                                                });
                                              },
                                              dropdownMenuEntries: addr2List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 20, bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr3Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '역 선택',
                                              onSelected: (String? value) {
                                                setState(() {
                                                  addr4Controller.text = '';
                                                  setAddr3();
                                                });
                                              },
                                              dropdownMenuEntries: addr3List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                              //controller: homeController,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr4Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '출구 선택',
                                              onSelected: (String? value) {},
                                              dropdownMenuEntries: addr4List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                              //controller: homeController,
                                            ),
                                          ),
                                        ],
                                      )
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('출발일')),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 20, bottom: 20),
                                        child: DropdownMenu(
                                          controller: monthController,
                                          errorText: _monthValidate
                                              ? '월을 선택해주세요'
                                              : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '월 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem1List
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
                                          controller: dayController,
                                          errorText:
                                              _dayValidate ? '일을 선택해주세요' : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '일 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem2List
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('출발 시간')),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 20, bottom: 20),
                                        child: DropdownMenu(
                                          controller: hourController,
                                          errorText: _hourValidate
                                              ? '시간을 선택해주세요'
                                              : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '시 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem3List
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
                                          controller: minuteController,
                                          errorText: _minuteValidate
                                              ? '분을 선택해주세요'
                                              : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '분 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem4List
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('도착지')),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  height: 45,
                                  width: 80,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFF9EA1CA)))),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('용인대학교'),
                                    ),
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('탑승인원')),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, bottom: 20),
                                    child: DropdownMenu(
                                      controller: numberController,
                                      errorText: _numberValidate
                                          ? '탑승 인원을 선택해주세요'
                                          : null,
                                      width: 150,
                                      initialSelection: numberList.first,
                                      hintText: '인원 수 선택',
                                      onSelected: (String? value) {},
                                      dropdownMenuEntries: numberList
                                          .map<DropdownMenuEntry<String>>(
                                              (String value) {
                                        return DropdownMenuEntry<String>(
                                          value: value,
                                          label: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 10),
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('출발지')),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  height: 45,
                                  width: 80,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFF9EA1CA)))),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('용인대학교'),
                                    ),
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('출발일')),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 20, bottom: 20),
                                        child: DropdownMenu(
                                          controller: monthController,
                                          errorText: _monthValidate
                                              ? '월을 선택해주세요'
                                              : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '월 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem1List
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
                                          controller: dayController,
                                          errorText:
                                              _dayValidate ? '일을 선택해주세요' : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '일 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem2List
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('출발 시간')),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 20, bottom: 20),
                                        child: DropdownMenu(
                                          controller: hourController,
                                          errorText: _hourValidate
                                              ? '시간을 선택해주세요'
                                              : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '시 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem3List
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
                                          controller: minuteController,
                                          errorText: _minuteValidate
                                              ? '분을 선택해주세요'
                                              : null,
                                          width: 120,
                                          //initialSelection: '',
                                          hintText: '분 선택',
                                          onSelected: (String? value) {},
                                          dropdownMenuEntries: tiem4List
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('도착지')),
                                ),
                                Container(
                                  //padding: EdgeInsets.only(bottom: 10),
                                  height: 180,
                                  width: 300,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 20, bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr1Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '시 선택',

                                              onSelected: (String? value) {
                                                setState(() {
                                                  addr2Controller.text = '';
                                                  setAddr1();
                                                });
                                              },
                                              dropdownMenuEntries: addr1List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr2Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '구 선택',
                                              onSelected: (String? value) {
                                                setState(() {
                                                  addr3Controller.text = '';
                                                  setAddr2();
                                                });
                                              },
                                              dropdownMenuEntries: addr2List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 20, bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr3Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '역 선택',
                                              onSelected: (String? value) {
                                                setState(() {
                                                  addr4Controller.text = '';
                                                  setAddr3();
                                                });
                                              },
                                              dropdownMenuEntries: addr3List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: DropdownMenu(
                                              controller: addr4Controller,
                                              width: 120,
                                              //initialSelection: '',
                                              hintText: '출구 선택',
                                              onSelected: (String? value) {},
                                              dropdownMenuEntries: addr4List
                                                  .map<
                                                          DropdownMenuEntry<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuEntry<
                                                    String>(
                                                  value: value,
                                                  label: value,
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      )
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
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF000000)),
                                      child: Text('탑승인원')),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, bottom: 20),
                                    child: DropdownMenu(
                                      controller: numberController,
                                      errorText: _numberValidate
                                          ? '탑승 인원을 선택해주세요'
                                          : null,
                                      width: 150,
                                      initialSelection: numberList.first,
                                      hintText: '인원 수 선택',
                                      onSelected: (String? value) {},
                                      dropdownMenuEntries: numberList
                                          .map<DropdownMenuEntry<String>>(
                                              (String value) {
                                        return DropdownMenuEntry<String>(
                                          value: value,
                                          label: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      width: 100,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xffC1BDDA),
                          side:
                              BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                        ),
                        child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF000000)),
                            child: Text('작성하기')),
                        onPressed: () {
                          if (selectedButton == '등교') {
                            carpool1(
                              addr1Controller.text,
                              addr2Controller.text,
                              addr3Controller.text,
                              addr4Controller.text,
                              monthController.text,
                              dayController.text,
                              hourController.text,
                              minuteController.text,
                              selectedAddr,
                              numberController.text,
                            );
                          } else {
                            carpool2(
                              addr1Controller.text,
                              addr2Controller.text,
                              addr3Controller.text,
                              addr4Controller.text,
                              monthController.text,
                              dayController.text,
                              hourController.text,
                              minuteController.text,
                              selectedAddr,
                              numberController.text,
                            );
                          }

                          // Navigator.of(context).pop(
                          //   MaterialPageRoute(
                          //       builder: (BuildContext context) => StartScreen()),
                          // );
                        },
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void carpool1(
      String addr1,
      String addr2,
      String addr3,
      String addr4,
      String month,
      String day,
      String hour,
      String minute,
      String fixAddr,
      String num) async {
    print(
        "확인 ${addr1}, ${addr2}, ${addr3}, ${addr4}, ${month}, ${day}, ${hour}, ${minute}, ${fixAddr}, ${num} ");
    setState(() {
      _addr1Validate = addr1.isEmpty;
      _addr2Validate = addr2.isEmpty;
      _addr3Validate = addr3.isEmpty;
      _addr4Validate = addr4.isEmpty;
      _monthValidate = month.isEmpty;
      _dayValidate = day.isEmpty;
      _hourValidate = hour.isEmpty;
      _minuteValidate = minute.isEmpty;
      _numberValidate = num.isEmpty;
    });

    if (!_addr1Validate &&
        !_addr2Validate &&
        !_addr3Validate &&
        !_addr4Validate &&
        !_monthValidate &&
        !_dayValidate &&
        !_hourValidate &&
        !_minuteValidate &&
        !_numberValidate) {
      var token = await getToken();
      var url = Uri.parse("${dotenv.env['API_URL']}:8080/carpool/create");
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'start': "${addr1} ${addr2} ${addr3} ${addr4} 출구",
          'end': fixAddr,
          'date': "2024-${month}-${day}T${hour}:${minute}",
          'memberNum': num,
          'checkNum': "0"
        }),
      );
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('게시물 생성 완료'),
                  content: Text('게시물 생성이 완료되었습니다.'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      StartScreen()),
                              (route) => false);
                        },
                        child: Text('확인'))
                  ]);
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('게시물 생성 실패'),
                  content: Text('게시물 생성에 실패하셨습니다.'),
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

  void carpool2(
      String addr1,
      String addr2,
      String addr3,
      String addr4,
      String month,
      String day,
      String hour,
      String minute,
      String fixAddr,
      String num) async {
    print(
        "확인 ${addr1}, ${addr2}, ${addr3}, ${addr4}, ${month}, ${day}, ${hour}, ${minute}, ${fixAddr}, ${num} ");
    setState(() {
      _addr1Validate = addr1.isEmpty;
      _addr2Validate = addr2.isEmpty;
      _addr3Validate = addr3.isEmpty;
      _addr4Validate = addr4.isEmpty;
      _monthValidate = month.isEmpty;
      _dayValidate = day.isEmpty;
      _hourValidate = hour.isEmpty;
      _minuteValidate = minute.isEmpty;
      _numberValidate = num.isEmpty;
    });

    if (!_addr1Validate &&
        !_addr2Validate &&
        !_addr3Validate &&
        !_addr4Validate &&
        !_monthValidate &&
        !_dayValidate &&
        !_hourValidate &&
        !_minuteValidate &&
        !_numberValidate) {
      var token = await getToken();
      var url = Uri.parse("${dotenv.env['API_URL']}:8080/carpool/create");
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'start': fixAddr,
          'end': "${addr1} ${addr2} ${addr3} ${addr4} 출구",
          'date': "2024-${month}-${day}T${hour}:${minute}",
          'memberNum': num,
          'checkNum': "0"
        }),
      );
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('게시물 생성 완료'),
                  content: Text('게시물 생성이 완료되었습니다.'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      StartScreen()),
                              (route) => false);
                        },
                        child: Text('확인'))
                  ]);
            });
      } else {
        print(response.statusCode);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('게시물 생성 실패'),
                  content: Text('게시물 생성에 실패하셨습니다.'),
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

  void setAddr1() {
    if (addr1Controller.text == '인천광역시') {
      addr2List = ['계양구', '부평구', '남동구', '미추홀구', '연수구', '서구', '중구', '남구', '동구'];
    } else if (addr1Controller.text == '부천시') {
      addr2List = ['원미구', '소사구', '오정구', '대야동'];
    } else if (addr1Controller.text == '용인시') {
      addr2List = ['기흥구', '처인구', '수지구'];
    } else if (addr1Controller.text == '서울특별시') {
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
    } else if (addr1Controller.text == '성남시') {
      addr2List = ['분당구', '수정구', '성남시', '중원구'];
    } else if (addr1Controller.text == '수원시') {
      addr2List = ['영통구', '권선구', '팔달구'];
    } else if (addr1Controller.text == '김포시') {
      addr2List = ['양촌읍', '구래동', '마산동', '장기동', '운양동', '북변동', '사우동', '고촌읍'];
    } else if (addr1Controller.text == '남양주시') {
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
    } else if (addr1Controller.text == '고양시') {
      addr2List = ['덕양구', '화전동', '일산동구', '일산서구'];
    } else if (addr1Controller.text == '하남시') {
      addr2List = ['망월동', '덕풍동', '창우동'];
    } else if (addr1Controller.text == '의정부시') {
      addr2List = ['장암동', '신곡동', '호원동', '의정부동', '금오동', '용현동'];
    } else if (addr1Controller.text == '광명시') {
      addr2List = ['철산동', '광명동'];
    } else if (addr1Controller.text == '광주시') {
      addr2List = ['중대동', '역동', '초월읍', '곤지암읍'];
    } else if (addr1Controller.text == '이천시') {
      addr2List = ['신둔면', '율현동', '부발읍'];
    } else if (addr1Controller.text == '여주시') {
      addr2List = ['세종대왕면', '교동'];
    } else if (addr1Controller.text == '파주시') {
      addr2List = ['문산읍', '서구', '야당동', '금촌동', '월롱면', '파주읍'];
    } else if (addr1Controller.text == '양평군') {
      addr2List = ['지평면', '양서면', '옥천면', '양평읍', '용문면'];
    } else if (addr1Controller.text == '구리시') {
      addr2List = ['인창동', '갈매동'];
    } else if (addr1Controller.text == '가평군') {
      addr2List = ['청평면', '가평읍'];
    } else if (addr1Controller.text == '춘천시') {
      addr2List = ['남산면', '신동면', '퇴계동', '근화동'];
    } else if (addr1Controller.text == '화성시') {
      addr2List = ['매송면'];
    } else if (addr1Controller.text == '안산시') {
      addr2List = ['상록구', '단원구'];
    } else if (addr1Controller.text == '시흥시') {
      addr2List = ['정왕동', '월곶동', '신천동', '미산동', '광석동', '능곡동'];
    } else if (addr1Controller.text == '과천시') {
      addr2List = ['과천동', '막계동', '별양동', '중앙동'];
    } else if (addr1Controller.text == '안양시') {
      addr2List = ['동안구'];
    } else if (addr1Controller.text == '군포시') {
      addr2List = ['산본동', '대야미동'];
    } else {
      addr2List = ['오류'];
    }
  }

  void setAddr2() {
    if (addr2Controller.text == '계양구') {
      addr3List = [
        '계양',
        '귤현',
        '박촌',
        '임학',
        '계산',
        '경인교대입구',
        '작전',
        '계양',
      ];
    } else if (addr2Controller.text == '부평구') {
      addr3List = [
        '갈산',
        '부평구청',
        '부평시장',
        '부평',
        '동수',
        '부평삼거리',
        '삼산체육관',
        '굴포천',
        '부평구청',
        '산곡',
        '부개역',
        '부평역',
        '백운역',
        '동암역'
      ];
    } else if (addr2Controller.text == '남동구') {
      addr3List = [
        '간석오거리',
        '인천시청',
        '예술회관',
        '인천시청',
        '석천사거리',
        '모래내시장',
        '만수',
        '남동구청',
        '인천대공원',
        '운연',
        '간석역',
        '소래포구역',
        '인천논현역',
        '호구포역',
        '남동인더스파크역'
      ];
    } else if (addr2Controller.text == '미추홀구') {
      addr3List = ['인천터미널', '주안', '시민공원', '석바위시장'];
    } else if (addr2Controller.text == '연수구') {
      addr3List = [
        '문학경기장',
        '선학',
        '신연수',
        '원인재',
        '동춘',
        '동막',
        '캠퍼스타운',
        '테크노파크',
        '지식정보단지',
        '인천대입구',
        '센트럴파크',
        '국제업무지구',
        '송도달빛축제공원',
        '원인재역',
        '연수역',
        '송도역'
      ];
    } else if (addr2Controller.text == '서구') {
      addr3List = [
        '검단오류',
        '왕길',
        '검단사거리',
        '마전',
        '완정',
        '독정',
        '검암',
        '검바위',
        '아시아드경기장',
        '서구청',
        '가정',
        '가정중앙시장',
        '석남',
        '서부여성회관',
        '인천가좌',
        '가재울',
        '주안국가산단',
        '석남',
        '검암',
        '청라국제도시',
        '운천역'
      ];
    } else if (addr2Controller.text == '원미구') {
      addr3List = [
        '까치울',
        '부천종합운동장',
        '춘의',
        '신중동',
        '부천시청',
        '상동',
        '역곡역',
        '부천종합운동장역',
        '소사역'
      ];
    } else if (addr2Controller.text == '기흥구') {
      addr3List = [
        '기흥',
        '강남대',
        '지석',
        '어정',
        '동백',
        '초당',
        '구성역',
        '신갈역',
        '상갈역',
      ];
    } else if (addr2Controller.text == '처인구') {
      addr3List = [
        '삼가',
        '시청·용인대',
        '명지대',
        '김량장',
        '운동장·송담대',
        '고진',
        '보평',
        '둔전',
        '전대·에버랜드',
      ];
    } else if (addr2Controller.text == '용산구') {
      addr3List = [
        '서울',
        '서울역',
        '숙대입구',
        '삼각지',
        '신용산',
        '이촌',
        '효창공원앞',
        '삼각지',
        '녹사평',
        '이태원',
        '한강진',
        '서울역',
        '용산역',
        '효창공원앞역',
        '이촌역',
        '서빙고역',
        '한남역',
      ];
    } else if (addr2Controller.text == '마포구') {
      addr3List = [
        '공덕',
        '홍대입구',
        '디지털미디어시티',
        '합정',
        '홍대입구',
        '신촌',
        '이대',
        '아현',
        '마포',
        '공덕',
        '애오개',
        '월드컵경기장',
        '마포구청',
        '망원',
        '합정',
        '상수',
        '광흥창',
        '대흥',
        '공덕',
        '공덕역',
        '서강대역',
        '홍대입구역'
      ];
    } else if (addr2Controller.text == '강서구') {
      addr3List = [
        '마곡나루',
        '김포공항',
        '김포공항역',
        '방화',
        '개화산',
        '김포공항',
        '송정',
        '마곡',
        '발산',
        '우장산',
        '화곡',
        '까치산',
        '개화',
        '김포공항',
        '공항시장',
        '신방화',
        '마곡나루',
        '양천향교',
        '가양',
        '증미',
        '등촌',
        '염창',
        '김포공항역',
      ];
    } else if (addr2Controller.text == '중구') {
      addr3List = [
        '영종',
        '운서',
        '공항화물청사',
        '시청',
        '서울역',
        '을지로입구',
        '을지로3가',
        '을지로4가',
        '동대문역사문화공원',
        '신당',
        '충무로',
        '동대입구',
        '약수',
        '명동',
        '회현',
        '청구',
        '버티고개',
        '동인천역',
        '인천역',
        '신포역',
        '인천'
      ];
    } else if (addr2Controller.text == '강북구') {
      addr3List = [
        '북한산우이',
        '솔밭공원',
        '4.19민주묘지',
        '가오리',
        '화계',
        '삼양',
        '삼양사거리',
        '솔샘',
        '수유',
        '미아',
        '미아사거리'
      ];
    } else if (addr2Controller.text == '성북구') {
      addr3List = [
        '북한산보국문',
        '정릉',
        '성신여대입구',
        '보문',
        '길음',
        '한성대입구',
        '안암',
        '고려대',
        '월곡',
        '상월곡',
        '돌곶이',
      ];
    } else if (addr2Controller.text == '동대문구') {
      addr3List = ['신설동', '청량리', '제기동', '용두', '장한평', '청량리역', '회기역'];
    } else if (addr2Controller.text == '강남구') {
      addr3List = [
        '신사',
        '논현',
        '신논현',
        '강남',
        '삼성',
        '선릉',
        '역삼',
        '압구정',
        '매봉',
        '도곡',
        '대치',
        '학여울',
        '대청',
        '일원',
        '수서',
        '청담',
        '강남구청',
        '학동',
        '언주',
        '선정릉',
        '삼성중앙',
        '봉은사',
        '압구정로데오역',
        '강남구청역',
        '선정릉역',
        '선릉역',
        '한티역',
        '도곡역',
        '구룡역',
        '개포동역',
        '대모산입구역',
        '수서역'
      ];
    } else if (addr2Controller.text == '서초구') {
      addr3List = [
        '양재',
        '양재시민의숲',
        '청계산입구',
        '교대',
        '서초',
        '방배',
        '잠원',
        '고속터미널',
        '남부터미널',
        '남태령',
        '반포',
        '내방',
        '구반포',
        '신반포',
        '사평'
      ];
    } else if (addr2Controller.text == '분당구') {
      addr3List = ['판교', '정자', '미금', '판교역', '이매역', '서현역', '수내역', '정자역', '오리역'];
    } else if (addr2Controller.text == '수지구') {
      addr3List = ['동천', '수지구청', '성복', '상현', '죽전역', '보정역'];
    } else if (addr2Controller.text == '영통구') {
      addr3List = ['광교중앙', '광교', '청명역', '영통역', '망포역'];
    } else if (addr2Controller.text == '영등포구') {
      addr3List = [
        '샛강',
        '대방',
        '문래',
        '영등포구청',
        '당산',
        '양평',
        '영등포시장',
        '신길',
        '여의도',
        '여의나루',
        '신풍',
        '대림',
        '선유도',
        '국회의사당'
      ];
    } else if (addr2Controller.text == '동작구') {
      addr3List = [
        '서울지방병무청',
        '보라매',
        '보라매공원',
        '보라매병원',
        '사당',
        '신대방',
        '동작',
        '총신대입구',
        '남성',
        '숭실대입구',
        '상도',
        '장승배기',
        '신대방삼거리',
        '노량진',
        '노들',
        '흑석'
      ];
    } else if (addr2Controller.text == '관악구') {
      addr3List = ['당곡', '신림', '서원', '서울대벤처타운', '관악산', '낙성대', '서울대입구', '봉천'];
    } else if (addr2Controller.text == '양촌읍') {
      addr3List = ['양촌역'];
    } else if (addr2Controller.text == '구래동') {
      addr3List = ['구래역'];
    } else if (addr2Controller.text == '마산동') {
      addr3List = ['마산역'];
    } else if (addr2Controller.text == '장기동') {
      addr3List = ['장기역'];
    } else if (addr2Controller.text == '운양동') {
      addr3List = ['운양역'];
    } else if (addr2Controller.text == '북변동') {
      addr3List = ['걸포북변역'];
    } else if (addr2Controller.text == '사우동') {
      addr3List = ['사우역', '풍무역'];
    } else if (addr2Controller.text == '고촌읍') {
      addr3List = ['고촌역'];
    } else if (addr2Controller.text == '별내동') {
      addr3List = ['별내별가람역', '별내역'];
    } else if (addr2Controller.text == '오남동') {
      addr3List = ['오남역'];
    } else if (addr2Controller.text == '진접읍') {
      addr3List = ['진접역'];
    } else if (addr2Controller.text == '종로구') {
      addr3List = [
        '동묘앞',
        '동대문',
        '종로5가',
        '종로3가',
        '종각',
        '경복궁',
        '안국',
        '혜화',
        '서대문',
        '광화문',
        '창신'
      ];
    } else if (addr2Controller.text == '성동구') {
      addr3List = [
        '상왕십리',
        '왕십리',
        '한양대',
        '뚝섬',
        '성수',
        '용답',
        '신답',
        '금호',
        '옥수',
        '신금호',
        '행당',
        '마장',
        '답십리',
        '왕십리역',
        '옥수역',
        '응봉역',
        '서울숲역'
      ];
    } else if (addr2Controller.text == '광진구') {
      addr3List = [
        '건대입구',
        '구의',
        '강변',
        '군자',
        '아차산',
        '광나루',
        '중곡',
        '어린이대공원',
        '뚝섬유원지'
      ];
    } else if (addr2Controller.text == '송파구') {
      addr3List = [
        '잠실나루',
        '잠실',
        '잠실새내',
        '종합운동장',
        '가락시장',
        '경찰병원',
        '오금',
        '올림픽공원',
        '방이',
        '개롱',
        '거여',
        '마천',
        '몽촌토성',
        '석촌',
        '송파',
        '문정',
        '장지',
        '복정',
        '삼전',
        '석촌고분',
        '송파나루',
        '한성백제'
      ];
    } else if (addr2Controller.text == '구로구') {
      addr3List = [
        '구로디지털단지',
        '대림',
        '신도림',
        '도림천',
        '남구로',
        '천왕',
        '온수',
        '구일역',
        '개봉역',
        '오류동역',
        '온수역'
      ];
    } else if (addr2Controller.text == '서대문구') {
      addr3List = ['충정로', '홍제', '무악재', '독립문', '신촌역', '가좌역'];
    } else if (addr2Controller.text == '양천구') {
      addr3List = ['양천구청', '신정네거리', '신정', '목동', '오목교', '신목동'];
    } else if (addr2Controller.text == '덕양구') {
      addr3List = [
        '지축',
        '강매역',
        '행신역',
        '능곡역',
        '대곡역',
        '지축역',
        '삼송역',
        '원흥역',
        '원당역',
        '화정역'
      ];
    } else if (addr2Controller.text == '은평구') {
      addr3List = [
        '구파발',
        '연신내',
        '불광',
        '녹번',
        '응암',
        '역촌',
        '독바위',
        '구산',
        '새절',
        '증산',
        '디지털미디어시티',
        '디지털미디어시티역',
        '수색역'
      ];
    } else if (addr2Controller.text == '노원구') {
      addr3List = [
        '당고개',
        '상계',
        '노원',
        '석계',
        '태릉입구',
        '화랑대',
        '수락산',
        '마들',
        '중계',
        '하계',
        '공릉'
      ];
    } else if (addr2Controller.text == '도봉구') {
      addr3List = ['창동', '쌍문', '도봉산'];
    } else if (addr2Controller.text == '강동구') {
      addr3List = [
        '천호',
        '강동',
        '길동',
        '굽은다리',
        '명일',
        '고덕',
        '상일동',
        '둔촌동',
        '강일',
        '암사',
        '강동구청',
        '둔촌오륜',
        '중앙보훈병원'
      ];
    } else if (addr2Controller.text == '망월동') {
      addr3List = ['미사'];
    } else if (addr2Controller.text == '덕풍동') {
      addr3List = ['하남풍산', '하남시청'];
    } else if (addr2Controller.text == '창우동') {
      addr3List = ['하남검단산'];
    } else if (addr2Controller.text == '중랑구') {
      addr3List = [
        '봉화',
        '신내',
        '먹골',
        '중화',
        '상봉',
        '면목',
        '사가정',
        '용마산',
        '중랑역',
        '상봉역',
        '망우역',
        '양원역',
        '신내역'
      ];
    } else if (addr2Controller.text == '장암동') {
      addr3List = ['장암'];
    } else if (addr2Controller.text == '금천구') {
      addr3List = ['가산디지털단지'];
    } else if (addr2Controller.text == '철산동') {
      addr3List = ['철산'];
    } else if (addr2Controller.text == '광명동') {
      addr3List = ['광명사거리'];
    } else if (addr2Controller.text == '수정구') {
      addr3List = [
        '남위례',
        '산성',
        '남한산성입구',
        '단대오거리',
        '신흥',
        '수진',
        '모란',
        '가천대역',
        '태평역',
        '미금역'
      ];
    } else if (addr2Controller.text == '신곡동') {
      addr3List = ['발곡', '동오', '새말', '경기도청북부청사', '효자'];
    } else if (addr2Controller.text == '호원동') {
      addr3List = ['회룡', '범골'];
    } else if (addr2Controller.text == '의정부동') {
      addr3List = ['경전철의정부', '의정부시청', '흥선', '의정부중앙'];
    } else if (addr2Controller.text == '금오동') {
      addr3List = ['곤제'];
    } else if (addr2Controller.text == '용현동') {
      addr3List = ['어룡', '송산', '탑석'];
    } else if (addr2Controller.text == '중대동') {
      addr3List = ['삼동역'];
    } else if (addr2Controller.text == '역동') {
      addr3List = ['경기광주역'];
    } else if (addr2Controller.text == '초월읍') {
      addr3List = ['초월역'];
    } else if (addr2Controller.text == '곤지암읍') {
      addr3List = ['곤지암역'];
    } else if (addr2Controller.text == '신둔면') {
      addr3List = ['신둔도예촌역'];
    } else if (addr2Controller.text == '율현동') {
      addr3List = ['이천역'];
    } else if (addr2Controller.text == '부발읍') {
      addr3List = ['부발역'];
    } else if (addr2Controller.text == '세종대왕면') {
      addr3List = ['세종대왕릉역'];
    } else if (addr2Controller.text == '교동') {
      addr3List = ['여주역'];
    } else if (addr2Controller.text == '문산읍') {
      addr3List = ['임진강역', '문산역'];
    } else if (addr2Controller.text == '화전동') {
      addr3List = ['한국항공대역'];
    } else if (addr2Controller.text == '일산동구') {
      addr3List = ['곡산역', '백마역', '풍산역', '백석역', '마두역', '정발산역'];
    } else if (addr2Controller.text == '일산서구') {
      addr3List = ['일산역', '탄현역', '주엽역', '대화역'];
    } else if (addr2Controller.text == '야당동') {
      addr3List = ['야당역', '운정역'];
    } else if (addr2Controller.text == '지평면') {
      addr3List = ['지평역'];
    } else if (addr2Controller.text == '인창동') {
      addr3List = ['구리역'];
    } else if (addr2Controller.text == '다산동') {
      addr3List = ['도농역'];
    } else if (addr2Controller.text == '이패동') {
      addr3List = ['양정역'];
    } else if (addr2Controller.text == '와부읍') {
      addr3List = ['덕소역', '도심역', '팔당역'];
    } else if (addr2Controller.text == '조안면') {
      addr3List = ['운길산역'];
    } else if (addr2Controller.text == '양서면') {
      addr3List = ['양수역', '신원역', '국수역'];
    } else if (addr2Controller.text == '옥천면') {
      addr3List = ['아신역'];
    } else if (addr2Controller.text == '양평읍') {
      addr3List = ['오빈역', '양평역', '원덕역'];
    } else if (addr2Controller.text == '용문면') {
      addr3List = ['용문역'];
    } else if (addr2Controller.text == '금촌동') {
      addr3List = ['금릉역', '금촌역'];
    } else if (addr2Controller.text == '월롱면') {
      addr3List = ['월롱역'];
    } else if (addr2Controller.text == '파주읍') {
      addr3List = ['파주역'];
    } else if (addr2Controller.text == '소사구') {
      addr3List = ['소사역', '부천역', '중동역', '송내역', '소새울역'];
    } else if (addr2Controller.text == '남구') {
      addr3List = ['주안역', '도화역', '제물포역', '인하대역', '숭의역'];
    } else if (addr2Controller.text == '동구') {
      addr3List = ['도원역'];
    } else if (addr2Controller.text == '갈매동') {
      addr3List = ['갈매역'];
    } else if (addr2Controller.text == '퇴계원읍') {
      addr3List = ['퇴계원역'];
    } else if (addr2Controller.text == '진건읍') {
      addr3List = ['사릉역'];
    } else if (addr2Controller.text == '금곡동') {
      addr3List = ['금곡역'];
    } else if (addr2Controller.text == '평내동') {
      addr3List = ['평내호평역'];
    } else if (addr2Controller.text == '화도읍') {
      addr3List = ['천마산역', '마석역'];
    } else if (addr2Controller.text == '청평면') {
      addr3List = ['대성리역', '청평역', '상천역'];
    } else if (addr2Controller.text == '가평읍') {
      addr3List = ['가평역'];
    } else if (addr2Controller.text == '남산면') {
      addr3List = ['굴봉산역', '백양리역', '강촌역'];
    } else if (addr2Controller.text == '신동면') {
      addr3List = ['김유정역'];
    } else if (addr2Controller.text == '퇴계동') {
      addr3List = ['남춘천역'];
    } else if (addr2Controller.text == '근화동') {
      addr3List = ['춘천역'];
    } else if (addr2Controller.text == '성남시') {
      addr3List = ['복정역', '야탑역', '이매역'];
    } else if (addr2Controller.text == '중원구') {
      addr3List = ['모란역'];
    } else if (addr2Controller.text == '권선구') {
      addr3List = ['매탄권선역', '수원시청역', '고색역', '오목천역'];
    } else if (addr2Controller.text == '팔달구') {
      addr3List = ['매교역', '수원역'];
    } else if (addr2Controller.text == '매송면') {
      addr3List = ['어천역', '야목역'];
    } else if (addr2Controller.text == '상록구') {
      addr3List = ['사리역', '한대앞역', '고잔역', '반월역', '상록수역'];
    } else if (addr2Controller.text == '단원구') {
      addr3List = [
        '중앙역',
        '초지역',
        '안산역',
        '신길온천역',
        '정왕역',
        '고잔역',
        '달미역',
        '선부역',
        '시우역',
        '원시역'
      ];
    } else if (addr2Controller.text == '정왕동') {
      addr3List = ['오이도역', '정왕역'];
    } else if (addr2Controller.text == '월곶동') {
      addr3List = ['달월역', '월곶역'];
    } else if (addr2Controller.text == '과천동') {
      addr3List = ['선바위역', '경마공원역'];
    } else if (addr2Controller.text == '막계동') {
      addr3List = ['대공원역'];
    } else if (addr2Controller.text == '별양동') {
      addr3List = ['과천역'];
    } else if (addr2Controller.text == '중앙동') {
      addr3List = ['정부과천청사역'];
    } else if (addr2Controller.text == '동안구') {
      addr3List = ['인덕원역', '평촌역', '범계역'];
    } else if (addr2Controller.text == '산본동') {
      addr3List = ['산본역', '수리산역'];
    } else if (addr2Controller.text == '대야미동') {
      addr3List = ['대야미역'];
    } else if (addr2Controller.text == '오정구') {
      addr3List = ['원종역'];
    } else if (addr2Controller.text == '대야동') {
      addr3List = ['시흥대야역'];
    } else if (addr2Controller.text == '신천동') {
      addr3List = ['신천역'];
    } else if (addr2Controller.text == '미산동') {
      addr3List = ['신현역'];
    } else if (addr2Controller.text == '광석동') {
      addr3List = ['시흥시청역'];
    } else if (addr2Controller.text == '능곡동') {
      addr3List = ['시흥능곡역'];
    } else {
      addr3List = ['오류'];
    }
  }

  void setAddr3() {
    int count = 0;
    if (addr3Controller.text == '계양' ||
        addr3Controller.text == '귤현' ||
        addr3Controller.text == '운연' ||
        addr3Controller.text == '시청·용인대' ||
        addr3Controller.text == '고진' ||
        addr3Controller.text == '계양' ||
        addr3Controller.text == '관악산' ||
        addr3Controller.text == '신답' ||
        addr3Controller.text == '학여울' ||
        addr3Controller.text == '독바위' ||
        addr3Controller.text == '장암' ||
        addr3Controller.text == '동오' ||
        addr3Controller.text == '새말' ||
        addr3Controller.text == '효자' ||
        addr3Controller.text == '탑석' ||
        addr3Controller.text == '이천역' ||
        addr3Controller.text == '부발역' ||
        addr3Controller.text == '세종대왕릉역' ||
        addr3Controller.text == '임진강역' ||
        addr3Controller.text == '운천역' ||
        addr3Controller.text == '서울역' ||
        addr3Controller.text == '수색역' ||
        addr3Controller.text == '능곡역' ||
        addr3Controller.text == '지평역' ||
        addr3Controller.text == '팔당역' ||
        addr3Controller.text == '신원역' ||
        addr3Controller.text == '국수역' ||
        addr3Controller.text == '아신역' ||
        addr3Controller.text == '오빈역' ||
        addr3Controller.text == '원덕역' ||
        addr3Controller.text == '월롱역' ||
        addr3Controller.text == '파주역' ||
        addr3Controller.text == '이촌역' ||
        addr3Controller.text == '한남역' ||
        addr3Controller.text == '사릉역' ||
        addr3Controller.text == '금곡역' ||
        addr3Controller.text == '상천역' ||
        addr3Controller.text == '가평역' ||
        addr3Controller.text == '백양리역' ||
        addr3Controller.text == '강촌역' ||
        addr3Controller.text == '김유정역' ||
        addr3Controller.text == '어천역' ||
        addr3Controller.text == '야목역' ||
        addr3Controller.text == '월곶역' ||
        addr3Controller.text == '송도역' ||
        addr3Controller.text == '반월역' ||
        addr3Controller.text == '달미역') {
      addr4List = ['1번'];
    } else if (addr3Controller.text == '문학경기장' ||
        addr3Controller.text == '검단오류' ||
        addr3Controller.text == '왕길' ||
        addr3Controller.text == '가정중앙시장' ||
        addr3Controller.text == '서부여성회관' ||
        addr3Controller.text == '인천가좌' ||
        addr3Controller.text == '주안국가산단' ||
        addr3Controller.text == '시민공원' ||
        addr3Controller.text == '석바위시장' ||
        addr3Controller.text == '초당' ||
        addr3Controller.text == '명지대' ||
        addr3Controller.text == '김량장' ||
        addr3Controller.text == '보평' ||
        addr3Controller.text == '둔전' ||
        addr3Controller.text == '청라국제도시' ||
        addr3Controller.text == '영종' ||
        addr3Controller.text == '운서' ||
        addr3Controller.text == '공항화물청사' ||
        addr3Controller.text == '북한산우이' ||
        addr3Controller.text == '솔밭공원' ||
        addr3Controller.text == '4.19민주묘지' ||
        addr3Controller.text == '가오리' ||
        addr3Controller.text == '화계' ||
        addr3Controller.text == '삼양' ||
        addr3Controller.text == '삼양사거리' ||
        addr3Controller.text == '솔샘' ||
        addr3Controller.text == '북한산보국문' ||
        addr3Controller.text == '정릉' ||
        addr3Controller.text == '청계산입구' ||
        addr3Controller.text == '광교' ||
        addr3Controller.text == '서울지방병무청' ||
        addr3Controller.text == '보라매공원' ||
        addr3Controller.text == '보라매병원' ||
        addr3Controller.text == '당곡' ||
        addr3Controller.text == '서원' ||
        addr3Controller.text == '서울대벤처타운' ||
        addr3Controller.text == '양촌역' ||
        addr3Controller.text == '걸포북변역' ||
        addr3Controller.text == '풍무역' ||
        addr3Controller.text == '고촌역' ||
        addr3Controller.text == '용답' ||
        addr3Controller.text == '도림천' ||
        addr3Controller.text == '양천구청' ||
        addr3Controller.text == '지축' ||
        addr3Controller.text == '창동' ||
        addr3Controller.text == '개화산' ||
        addr3Controller.text == '양평' ||
        addr3Controller.text == '마천' ||
        addr3Controller.text == '망원' ||
        addr3Controller.text == '개화' ||
        addr3Controller.text == '사평' ||
        addr3Controller.text == '둔촌오륜' ||
        addr3Controller.text == '발곡' ||
        addr3Controller.text == '범골' ||
        addr3Controller.text == '경전철의정부' ||
        addr3Controller.text == '의정부시청' ||
        addr3Controller.text == '흥선' ||
        addr3Controller.text == '의정부중앙' ||
        addr3Controller.text == '경기도청북부청사' ||
        addr3Controller.text == '곤제' ||
        addr3Controller.text == '어룡' ||
        addr3Controller.text == '송산' ||
        addr3Controller.text == '삼동역' ||
        addr3Controller.text == '경기광주역' ||
        addr3Controller.text == '초월역' ||
        addr3Controller.text == '곤지암역' ||
        addr3Controller.text == '신둔도예촌역' ||
        addr3Controller.text == '여주역' ||
        addr3Controller.text == '신촌역' ||
        addr3Controller.text == '서강대역' ||
        addr3Controller.text == '한국항공대역' ||
        addr3Controller.text == '강매역' ||
        addr3Controller.text == '행신역' ||
        addr3Controller.text == '곡산역' ||
        addr3Controller.text == '백마역' ||
        addr3Controller.text == '풍산역' ||
        addr3Controller.text == '일산역' ||
        addr3Controller.text == '탄현역' ||
        addr3Controller.text == '회기역' ||
        addr3Controller.text == '양원역' ||
        addr3Controller.text == '도농역' ||
        addr3Controller.text == '양정역' ||
        addr3Controller.text == '도심역' ||
        addr3Controller.text == '운길산역' ||
        addr3Controller.text == '양수역' ||
        addr3Controller.text == '양평역' ||
        addr3Controller.text == '운정역' ||
        addr3Controller.text == '금릉역' ||
        addr3Controller.text == '금촌역' ||
        addr3Controller.text == '문산역' ||
        addr3Controller.text == '서빙고역' ||
        addr3Controller.text == '응봉역' ||
        addr3Controller.text == '구일역' ||
        addr3Controller.text == '개봉역' ||
        addr3Controller.text == '역곡역' ||
        addr3Controller.text == '중동역' ||
        addr3Controller.text == '부개역' ||
        addr3Controller.text == '동암역' ||
        addr3Controller.text == '간석역' ||
        addr3Controller.text == '제물포역' ||
        addr3Controller.text == '회기역' ||
        addr3Controller.text == '갈매역' ||
        addr3Controller.text == '별내역' ||
        addr3Controller.text == '퇴계원역' ||
        addr3Controller.text == '평내호평역' ||
        addr3Controller.text == '마석역' ||
        addr3Controller.text == '대성리역' ||
        addr3Controller.text == '청평역' ||
        addr3Controller.text == '굴봉산역' ||
        addr3Controller.text == '춘천역' ||
        addr3Controller.text == '사리역' ||
        addr3Controller.text == '중앙역' ||
        addr3Controller.text == '고잔역' ||
        addr3Controller.text == '안산역' ||
        addr3Controller.text == '신길온천역' ||
        addr3Controller.text == '정왕역' ||
        addr3Controller.text == '달월역' ||
        addr3Controller.text == '소래포구역' ||
        addr3Controller.text == '호구포역' ||
        addr3Controller.text == '남동인더스파크역' ||
        addr3Controller.text == '대야미역' ||
        addr3Controller.text == '중앙역' ||
        addr3Controller.text == '고잔역' ||
        addr3Controller.text == '안산역' ||
        addr3Controller.text == '신길온천역' ||
        addr3Controller.text == '정왕역' ||
        addr3Controller.text == '지축역' ||
        addr3Controller.text == '신현역' ||
        addr3Controller.text == '원시역') {
      addr4List = ['1번', '2번'];
    } else if (addr3Controller.text == '센트럴파크' ||
        addr3Controller.text == '검단사거리' ||
        addr3Controller.text == '마전' ||
        addr3Controller.text == '독정' ||
        addr3Controller.text == '검암' ||
        addr3Controller.text == '인천대공원' ||
        addr3Controller.text == '강남대' ||
        addr3Controller.text == '어정' ||
        addr3Controller.text == '동백' ||
        addr3Controller.text == '삼가' ||
        addr3Controller.text == '운동장·송담대' ||
        addr3Controller.text == '검암' ||
        addr3Controller.text == '동천' ||
        addr3Controller.text == '사우역' ||
        addr3Controller.text == '오남역' ||
        addr3Controller.text == '도곡' ||
        addr3Controller.text == '신길' ||
        addr3Controller.text == '청구' ||
        addr3Controller.text == '길동' ||
        addr3Controller.text == '월드컵경기장' ||
        addr3Controller.text == '한강진' ||
        addr3Controller.text == '버티고개' ||
        addr3Controller.text == '청구' ||
        addr3Controller.text == '도봉산' ||
        addr3Controller.text == '면목' ||
        addr3Controller.text == '용마산' ||
        addr3Controller.text == '산성' ||
        addr3Controller.text == '신목동' ||
        addr3Controller.text == '구반포' ||
        addr3Controller.text == '중앙보훈병원' ||
        addr3Controller.text == '용산역' ||
        addr3Controller.text == '야당역' ||
        addr3Controller.text == '청량리역' ||
        addr3Controller.text == '망우역' ||
        addr3Controller.text == '구리역' ||
        addr3Controller.text == '덕소역' ||
        addr3Controller.text == '용문역' ||
        addr3Controller.text == '송내역' ||
        addr3Controller.text == '백운역' ||
        addr3Controller.text == '도원역' ||
        addr3Controller.text == '인천역' ||
        addr3Controller.text == '청량리역' ||
        addr3Controller.text == '망우역' ||
        addr3Controller.text == '천마산역' ||
        addr3Controller.text == '남춘천역' ||
        addr3Controller.text == '청량리역' ||
        addr3Controller.text == '도곡역' ||
        addr3Controller.text == '죽전역' ||
        addr3Controller.text == '구성역' ||
        addr3Controller.text == '고색역' ||
        addr3Controller.text == '오목천역' ||
        addr3Controller.text == '한대앞역' ||
        addr3Controller.text == '오이도역' ||
        addr3Controller.text == '인천' ||
        addr3Controller.text == '수리산역' ||
        addr3Controller.text == '한대앞역' ||
        addr3Controller.text == '오이도역' ||
        addr3Controller.text == '시흥대야역' ||
        addr3Controller.text == '시흥시청역') {
      addr4List = ['1번', '2번', '3번'];
    } else if (addr3Controller.text == '박촌' ||
        addr3Controller.text == '임학' ||
        addr3Controller.text == '갈산' ||
        addr3Controller.text == '부평시장' ||
        addr3Controller.text == '동수' ||
        addr3Controller.text == '부평삼거리' ||
        addr3Controller.text == '선학' ||
        addr3Controller.text == '신연수' ||
        addr3Controller.text == '동막' ||
        addr3Controller.text == '캠퍼스타운' ||
        addr3Controller.text == '테크노파크' ||
        addr3Controller.text == '지식정보단지' ||
        addr3Controller.text == '인천대입구' ||
        addr3Controller.text == '송도달빛축제공원' ||
        addr3Controller.text == '완정' ||
        addr3Controller.text == '검바위' ||
        addr3Controller.text == '아시아드경기장' ||
        addr3Controller.text == '서구청' ||
        addr3Controller.text == '가정' ||
        addr3Controller.text == '가재울' ||
        addr3Controller.text == '석천사거리' ||
        addr3Controller.text == '모래내시장' ||
        addr3Controller.text == '만수' ||
        addr3Controller.text == '남동구청' ||
        addr3Controller.text == '지석' ||
        addr3Controller.text == '전대·에버랜드' ||
        addr3Controller.text == '김포공항' ||
        addr3Controller.text == '판교' ||
        addr3Controller.text == '수지구청' ||
        addr3Controller.text == '상현' ||
        addr3Controller.text == '샛강' ||
        addr3Controller.text == '구래역' ||
        addr3Controller.text == '마산역' ||
        addr3Controller.text == '운양역' ||
        addr3Controller.text == '김포공항역' ||
        addr3Controller.text == '별내별가람역' ||
        addr3Controller.text == '한양대' ||
        addr3Controller.text == '성수' ||
        addr3Controller.text == '구의' ||
        addr3Controller.text == '강변' ||
        addr3Controller.text == '잠실나루' ||
        addr3Controller.text == '방배' ||
        addr3Controller.text == '신대방' ||
        addr3Controller.text == '아현' ||
        addr3Controller.text == '신정네거리' ||
        addr3Controller.text == '구파발' ||
        addr3Controller.text == '홍제' ||
        addr3Controller.text == '무악재' ||
        addr3Controller.text == '금호' ||
        addr3Controller.text == '잠원' ||
        addr3Controller.text == '매봉' ||
        addr3Controller.text == '경찰병원' ||
        addr3Controller.text == '쌍문' ||
        addr3Controller.text == '혜화' ||
        addr3Controller.text == '남태령' ||
        addr3Controller.text == '방화' ||
        addr3Controller.text == '김포공항' ||
        addr3Controller.text == '송정' ||
        addr3Controller.text == '우장산' ||
        addr3Controller.text == '까치산' ||
        addr3Controller.text == '영등포시장' ||
        addr3Controller.text == '여의나루' ||
        addr3Controller.text == '마포' ||
        addr3Controller.text == '애오개' ||
        addr3Controller.text == '행당' ||
        addr3Controller.text == '마장' ||
        addr3Controller.text == '광나루' ||
        addr3Controller.text == '강동' ||
        addr3Controller.text == '굽은다리' ||
        addr3Controller.text == '명일' ||
        addr3Controller.text == '둔촌동' ||
        addr3Controller.text == '올림픽공원' ||
        addr3Controller.text == '방이' ||
        addr3Controller.text == '개롱' ||
        addr3Controller.text == '강일' ||
        addr3Controller.text == '하남검단산' ||
        addr3Controller.text == '응암' ||
        addr3Controller.text == '역촌' ||
        addr3Controller.text == '구산' ||
        addr3Controller.text == '새절' ||
        addr3Controller.text == '증산' ||
        addr3Controller.text == '상수' ||
        addr3Controller.text == '대흥' ||
        addr3Controller.text == '녹사평' ||
        addr3Controller.text == '이태원' ||
        addr3Controller.text == '창신' ||
        addr3Controller.text == '안암' ||
        addr3Controller.text == '상월곡' ||
        addr3Controller.text == '신내' ||
        addr3Controller.text == '공릉' ||
        addr3Controller.text == '중화' ||
        addr3Controller.text == '사가정' ||
        addr3Controller.text == '중곡' ||
        addr3Controller.text == '뚝섬유원지' ||
        addr3Controller.text == '강남구청' ||
        addr3Controller.text == '남성' ||
        addr3Controller.text == '숭실대입구' ||
        addr3Controller.text == '철산' ||
        addr3Controller.text == '천왕' ||
        addr3Controller.text == '암사' ||
        addr3Controller.text == '송파' ||
        addr3Controller.text == '문정' ||
        addr3Controller.text == '장지' ||
        addr3Controller.text == '복정' ||
        addr3Controller.text == '남한산성입구' ||
        addr3Controller.text == '신흥' ||
        addr3Controller.text == '수진' ||
        addr3Controller.text == '김포공항' ||
        addr3Controller.text == '공항시장' ||
        addr3Controller.text == '증미' ||
        addr3Controller.text == '염창' ||
        addr3Controller.text == '샛강' ||
        addr3Controller.text == '흑석' ||
        addr3Controller.text == '신반포' ||
        addr3Controller.text == '선정릉' ||
        addr3Controller.text == '삼전' ||
        addr3Controller.text == '석촌고분' ||
        addr3Controller.text == '송파나루' ||
        addr3Controller.text == '한성백제' ||
        addr3Controller.text == '올림픽공원' ||
        addr3Controller.text == '판교역' ||
        addr3Controller.text == '가좌역' ||
        addr3Controller.text == '중랑역' ||
        addr3Controller.text == '오류동역' ||
        addr3Controller.text == '도화역' ||
        addr3Controller.text == '동인천역' ||
        addr3Controller.text == '중랑역' ||
        addr3Controller.text == '신내역' ||
        addr3Controller.text == '강남구청역' ||
        addr3Controller.text == '선정릉역' ||
        addr3Controller.text == '복정역' ||
        addr3Controller.text == '야탑역' ||
        addr3Controller.text == '수내역' ||
        addr3Controller.text == '보정역' ||
        addr3Controller.text == '신갈역' ||
        addr3Controller.text == '상갈역' ||
        addr3Controller.text == '인천논현역' ||
        addr3Controller.text == '연수역' ||
        addr3Controller.text == '숭의역' ||
        addr3Controller.text == '평촌역' ||
        addr3Controller.text == '산본역' ||
        addr3Controller.text == '상록수역' ||
        addr3Controller.text == '화정역' ||
        addr3Controller.text == '정발산역' ||
        addr3Controller.text == '김포공항역' ||
        addr3Controller.text == '원종역' ||
        addr3Controller.text == '소새울역' ||
        addr3Controller.text == '시흥능곡역' ||
        addr3Controller.text == '시우역') {
      addr4List = ['1번', '2번', '3번', '4번'];
    } else if (addr3Controller.text == '국제업무지구' ||
        addr3Controller.text == '까치울' ||
        addr3Controller.text == '부천시청' ||
        addr3Controller.text == '삼산체육관' ||
        addr3Controller.text == '양재시민의숲' ||
        addr3Controller.text == '성복' ||
        addr3Controller.text == '광교중앙' ||
        addr3Controller.text == '용두' ||
        addr3Controller.text == '연신내' ||
        addr3Controller.text == '녹번' ||
        addr3Controller.text == '독립문' ||
        addr3Controller.text == '경복궁' ||
        addr3Controller.text == '상계' ||
        addr3Controller.text == '이촌' ||
        addr3Controller.text == '신정' ||
        addr3Controller.text == '신금호' ||
        addr3Controller.text == '아차산' ||
        addr3Controller.text == '고덕' ||
        addr3Controller.text == '연신내' ||
        addr3Controller.text == '월곡' ||
        addr3Controller.text == '봉화' ||
        addr3Controller.text == '상도' ||
        addr3Controller.text == '강동구청' ||
        addr3Controller.text == '몽촌토성' ||
        addr3Controller.text == '남위례' ||
        addr3Controller.text == '노들' ||
        addr3Controller.text == '회룡' ||
        addr3Controller.text == '대곡역' ||
        addr3Controller.text == '부천역' ||
        addr3Controller.text == '서울숲역' ||
        addr3Controller.text == '구룡역' ||
        addr3Controller.text == '가천대역' ||
        addr3Controller.text == '서현역' ||
        addr3Controller.text == '매탄권선역' ||
        addr3Controller.text == '초지역' ||
        addr3Controller.text == '초지역' ||
        addr3Controller.text == '대곡역' ||
        addr3Controller.text == '선부역' ||
        addr3Controller.text == '초지역') {
      addr4List = ['1번', '2번', '3번', '4번', '5번'];
    } else if (addr3Controller.text == '계산' ||
        addr3Controller.text == '경인교대입구' ||
        addr3Controller.text == '인천터미널' ||
        addr3Controller.text == '원인재' ||
        addr3Controller.text == '동춘' ||
        addr3Controller.text == '석남' ||
        addr3Controller.text == '주안' ||
        addr3Controller.text == '인천시청' ||
        addr3Controller.text == '부천종합운동장' ||
        addr3Controller.text == '춘의' ||
        addr3Controller.text == '신중동' ||
        addr3Controller.text == '상동' ||
        addr3Controller.text == '굴포천' ||
        addr3Controller.text == '부평구청' ||
        addr3Controller.text == '산곡' ||
        addr3Controller.text == '석남' ||
        addr3Controller.text == '기흥' ||
        addr3Controller.text == '마곡나루' ||
        addr3Controller.text == '정자' ||
        addr3Controller.text == '장기역' ||
        addr3Controller.text == '진접역' ||
        addr3Controller.text == '청량리' ||
        addr3Controller.text == '제기동' ||
        addr3Controller.text == '상왕십리' ||
        addr3Controller.text == '건대입구' ||
        addr3Controller.text == '봉천' ||
        addr3Controller.text == '구로디지털단지' ||
        addr3Controller.text == '신도림' ||
        addr3Controller.text == '이대' ||
        addr3Controller.text == '불광' ||
        addr3Controller.text == '안국' ||
        addr3Controller.text == '동대입구' ||
        addr3Controller.text == '압구정' ||
        addr3Controller.text == '남부터미널' ||
        addr3Controller.text == '일원' ||
        addr3Controller.text == '수서' ||
        addr3Controller.text == '당고개' ||
        addr3Controller.text == '미아사거리' ||
        addr3Controller.text == '신용산' ||
        addr3Controller.text == '여의도' ||
        addr3Controller.text == '하남시청' ||
        addr3Controller.text == '광흥창' ||
        addr3Controller.text == '효창공원앞' ||
        addr3Controller.text == '고려대' ||
        addr3Controller.text == '수락산' ||
        addr3Controller.text == '중계' ||
        addr3Controller.text == '하계' ||
        addr3Controller.text == '어린이대공원' ||
        addr3Controller.text == '건대입구' ||
        addr3Controller.text == '반포' ||
        addr3Controller.text == '장승배기' ||
        addr3Controller.text == '신대방삼거리' ||
        addr3Controller.text == '신풍' ||
        addr3Controller.text == '남구로' ||
        addr3Controller.text == '마곡나루' ||
        addr3Controller.text == '국회의사당' ||
        addr3Controller.text == '여의도' ||
        addr3Controller.text == '효창공원앞역' ||
        addr3Controller.text == '주안역' ||
        addr3Controller.text == '수서역' ||
        addr3Controller.text == '태평역' ||
        addr3Controller.text == '정자역' ||
        addr3Controller.text == '청명역' ||
        addr3Controller.text == '원인재역' ||
        addr3Controller.text == '신포역' ||
        addr3Controller.text == '선바위역' ||
        addr3Controller.text == '경마공원역' ||
        addr3Controller.text == '대공원역' ||
        addr3Controller.text == '원당역' ||
        addr3Controller.text == '대화역' ||
        addr3Controller.text == '부천종합운동장역' ||
        addr3Controller.text == '신천역') {
      addr4List = ['1번', '2번', '3번', '4번', '5번', '6번'];
    } else if (addr3Controller.text == '성신여대입구' ||
        addr3Controller.text == '대방' ||
        addr3Controller.text == '신림' ||
        addr3Controller.text == '신림' ||
        addr3Controller.text == '문래' ||
        addr3Controller.text == '영등포구청' ||
        addr3Controller.text == '옥수' ||
        addr3Controller.text == '오금' ||
        addr3Controller.text == '성신여대입구' ||
        addr3Controller.text == '한성대입구' ||
        addr3Controller.text == '회현' ||
        addr3Controller.text == '마곡' ||
        addr3Controller.text == '영등포구청' ||
        addr3Controller.text == '오금' ||
        addr3Controller.text == '석계' ||
        addr3Controller.text == '화랑대' ||
        addr3Controller.text == '먹골' ||
        addr3Controller.text == '단대오거리' ||
        addr3Controller.text == '삼성중앙' ||
        addr3Controller.text == '봉은사' ||
        addr3Controller.text == '옥수역' ||
        addr3Controller.text == '소사역' ||
        addr3Controller.text == '부평역' ||
        addr3Controller.text == '압구정로데오역' ||
        addr3Controller.text == '오리역' ||
        addr3Controller.text == '인하대역' ||
        addr3Controller.text == '과천역' ||
        addr3Controller.text == '소사역') {
      addr4List = ['1번', '2번', '3번', '4번', '5번', '6번', '7번'];
    } else if (addr3Controller.text == '작전' ||
        addr3Controller.text == '부평' ||
        addr3Controller.text == '보문' ||
        addr3Controller.text == '신사' ||
        addr3Controller.text == '미금' ||
        addr3Controller.text == '보라매' ||
        addr3Controller.text == '종로5가' ||
        addr3Controller.text == '을지로입구' ||
        addr3Controller.text == '뚝섬' ||
        addr3Controller.text == '잠실새내' ||
        addr3Controller.text == '삼성' ||
        addr3Controller.text == '역삼' ||
        addr3Controller.text == '서초' ||
        addr3Controller.text == '낙성대' ||
        addr3Controller.text == '서울대입구' ||
        addr3Controller.text == '신촌' ||
        addr3Controller.text == '충무로' ||
        addr3Controller.text == '신사' ||
        addr3Controller.text == '고속터미널' ||
        addr3Controller.text == '대치' ||
        addr3Controller.text == '대청' ||
        addr3Controller.text == '가락시장' ||
        addr3Controller.text == '수유' ||
        addr3Controller.text == '미아' ||
        addr3Controller.text == '충무로' ||
        addr3Controller.text == '화곡' ||
        addr3Controller.text == '목동' ||
        addr3Controller.text == '오목교' ||
        addr3Controller.text == '서대문' ||
        addr3Controller.text == '답십리' ||
        addr3Controller.text == '장한평' ||
        addr3Controller.text == '군자' ||
        addr3Controller.text == '상일동' ||
        addr3Controller.text == '거여' ||
        addr3Controller.text == '하남풍산' ||
        addr3Controller.text == '마포구청' ||
        addr3Controller.text == '보문' ||
        addr3Controller.text == '돌곶이' ||
        addr3Controller.text == '태릉입구' ||
        addr3Controller.text == '마들' ||
        addr3Controller.text == '태릉입구' ||
        addr3Controller.text == '상봉' ||
        addr3Controller.text == '군자' ||
        addr3Controller.text == '고속터미널' ||
        addr3Controller.text == '내방' ||
        addr3Controller.text == '보라매' ||
        addr3Controller.text == '온수' ||
        addr3Controller.text == '석촌' ||
        addr3Controller.text == '가락시장' ||
        addr3Controller.text == '신방화' ||
        addr3Controller.text == '양천향교' ||
        addr3Controller.text == '등촌' ||
        addr3Controller.text == '선유도' ||
        addr3Controller.text == '고속터미널' ||
        addr3Controller.text == '언주' ||
        addr3Controller.text == '석촌' ||
        addr3Controller.text == '상봉역' ||
        addr3Controller.text == '온수역' ||
        addr3Controller.text == '상봉역' ||
        addr3Controller.text == '한티역' ||
        addr3Controller.text == '개포동역' ||
        addr3Controller.text == '대모산입구역' ||
        addr3Controller.text == '미금역' ||
        addr3Controller.text == '영통역' ||
        addr3Controller.text == '망포역' ||
        addr3Controller.text == '매교역' ||
        addr3Controller.text == '인덕원역' ||
        addr3Controller.text == '범계역' ||
        addr3Controller.text == '삼송역' ||
        addr3Controller.text == '원흥역' ||
        addr3Controller.text == '백석역' ||
        addr3Controller.text == '마두역' ||
        addr3Controller.text == '주엽역') {
      addr4List = ['1번', '2번', '3번', '4번', '5번', '6번', '7번', '8번'];
    } else if (addr3Controller.text == '부평구청' ||
        addr3Controller.text == '간석오거리' ||
        addr3Controller.text == '인천시청' ||
        addr3Controller.text == '홍대입구' ||
        addr3Controller.text == '디지털미디어시티' ||
        addr3Controller.text == '신논현' ||
        addr3Controller.text == '종합운동장' ||
        addr3Controller.text == '홍대입구' ||
        addr3Controller.text == '동작' ||
        addr3Controller.text == '발산' ||
        addr3Controller.text == '광화문' ||
        addr3Controller.text == '불광' ||
        addr3Controller.text == '디지털미디어시티' ||
        addr3Controller.text == '노량진' ||
        addr3Controller.text == '동작' ||
        addr3Controller.text == '신논현' ||
        addr3Controller.text == '종합운동장' ||
        addr3Controller.text == '이매역' ||
        addr3Controller.text == '홍대입구역' ||
        addr3Controller.text == '디지털미디어시티역' ||
        addr3Controller.text == '이매역' ||
        addr3Controller.text == '기흥역') {
      addr4List = ['1번', '2번', '3번', '4번', '5번', '6번', '7번', '8번', '9번'];
    } else if (addr3Controller.text == '공덕' ||
        addr3Controller.text == '논현' ||
        addr3Controller.text == '동묘앞' ||
        addr3Controller.text == '동대문' ||
        addr3Controller.text == '을지로4가' ||
        addr3Controller.text == '선릉' ||
        addr3Controller.text == '합정' ||
        addr3Controller.text == '충정로' ||
        addr3Controller.text == '약수' ||
        addr3Controller.text == '노원' ||
        addr3Controller.text == '길음' ||
        addr3Controller.text == '동대문' ||
        addr3Controller.text == '명동' ||
        addr3Controller.text == '숙대입구' ||
        addr3Controller.text == '공덕' ||
        addr3Controller.text == '충정로' ||
        addr3Controller.text == '을지로4가' ||
        addr3Controller.text == '천호' ||
        addr3Controller.text == '미사' ||
        addr3Controller.text == '합정' ||
        addr3Controller.text == '공덕' ||
        addr3Controller.text == '약수' ||
        addr3Controller.text == '동묘앞' ||
        addr3Controller.text == '노원' ||
        addr3Controller.text == '학동' ||
        addr3Controller.text == '논현' ||
        addr3Controller.text == '광명사거리' ||
        addr3Controller.text == '천호' ||
        addr3Controller.text == '가양' ||
        addr3Controller.text == '공덕역' ||
        addr3Controller.text == '선릉역' ||
        addr3Controller.text == '수원시청역' ||
        addr3Controller.text == '수원역') {
      addr4List = ['1번', '2번', '3번', '4번', '5번', '6번', '7번', '8번', '9번', '10번'];
    } else if (addr3Controller.text == '예술회관' ||
        addr3Controller.text == '잠실' ||
        addr3Controller.text == '가산디지털단지' ||
        addr3Controller.text == '잠실' ||
        addr3Controller.text == '정부과천청사역') {
      addr4List = [
        '1번',
        '2번',
        '3번',
        '4번',
        '5번',
        '6번',
        '7번',
        '8번',
        '9번',
        '10번',
        '11번'
      ];
    } else if (addr3Controller.text == '신설동' ||
        addr3Controller.text == '강남' ||
        addr3Controller.text == '양재' ||
        addr3Controller.text == '신설동' ||
        addr3Controller.text == '종각' ||
        addr3Controller.text == '시청' ||
        addr3Controller.text == '을지로3가' ||
        addr3Controller.text == '신당' ||
        addr3Controller.text == '강남' ||
        addr3Controller.text == '대림' ||
        addr3Controller.text == '신설동' ||
        addr3Controller.text == '을지로3가' ||
        addr3Controller.text == '양재' ||
        addr3Controller.text == '신당' ||
        addr3Controller.text == '대림' ||
        addr3Controller.text == '모란' ||
        addr3Controller.text == '모란역') {
      addr4List = [
        '1번',
        '2번',
        '3번',
        '4번',
        '5번',
        '6번',
        '7번',
        '8번',
        '9번',
        '10번',
        '11번',
        '12번'
      ];
    } else if (addr3Controller.text == '왕십리' ||
        addr3Controller.text == '당산' ||
        addr3Controller.text == '왕십리역' ||
        addr3Controller.text == '왕십리역') {
      addr4List = [
        '1번',
        '2번',
        '3번',
        '4번',
        '5번',
        '6번',
        '7번',
        '8번',
        '9번',
        '10번',
        '11번',
        '12번',
        '13번'
      ];
    } else if (addr3Controller.text == '동대문역사문화공원' ||
        addr3Controller.text == '교대' ||
        addr3Controller.text == '사당' ||
        addr3Controller.text == '교대' ||
        addr3Controller.text == '동대문역사문화공원' ||
        addr3Controller.text == '삼각지' ||
        addr3Controller.text == '총신대입구' ||
        addr3Controller.text == '사당' ||
        addr3Controller.text == '동대문역사문화공원' ||
        addr3Controller.text == '삼각지' ||
        addr3Controller.text == '청담' ||
        addr3Controller.text == '총신대입구') {
      addr4List = [
        '1번',
        '2번',
        '3번',
        '4번',
        '5번',
        '6번',
        '7번',
        '8번',
        '9번',
        '10번',
        '11번',
        '12번',
        '13번',
        '14번'
      ];
    } else if (addr3Controller.text == '서울' ||
        addr3Controller.text == '종로3가' ||
        addr3Controller.text == '서울역' ||
        addr3Controller.text == '종로3가' ||
        addr3Controller.text == '서울역' ||
        addr3Controller.text == '종로3가') {
      addr4List = [
        '1번',
        '2번',
        '3번',
        '4번',
        '5번',
        '6번',
        '7번',
        '8번',
        '9번',
        '10번',
        '11번',
        '12번',
        '13번',
        '14번',
        '15번'
      ];
    }
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
