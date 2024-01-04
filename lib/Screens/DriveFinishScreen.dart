import 'package:aisl_carpool_front/Screens/PostDetailScreen.dart';
import 'package:flutter/material.dart';

class DrivefinishScreen extends StatelessWidget {
  const DrivefinishScreen({super.key});

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
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
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
                                  margin: EdgeInsets.only(top: 3, left: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text('신논현역')),
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
                                  margin: EdgeInsets.only(top: 3, left: 10),
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000)),
                                      child: Text('용인대')),
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
                                      child: Text('23년 12월 25일')),
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
                                      child: Text('09시 25분')),
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
                                      child: Text('3명')),
                                ),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/titleLogo.png',
                          width: 100, scale: 1.3, color: Color(0xffC1BDDA)),
                      Image.asset('assets/titleLogo.png',
                          width: 100, scale: 1.3, color: Color(0xffC1BDDA)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  child: DefaultTextStyle(
                      style: TextStyle(fontSize: 15, color: Color(0xFF000000)),
                      child: Text('목적지로 이동중입니다. 도착하면 도착완료 버튼을 눌러주세요.')),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xffC1BDDA),
                        side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                      ),
                      child: (DefaultTextStyle(
                          style:
                              TextStyle(fontSize: 13, color: Color(0xFF000000)),
                          child: Text('도착완료'))),
                      onPressed: () {},
                    ),
                  )
                ]),
              ],
            ),
          ),
        ));
  }
}
