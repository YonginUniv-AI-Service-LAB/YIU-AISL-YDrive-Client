import 'package:aisl_carpool_front/Screens/CarpoolScreen.dart';
import 'package:aisl_carpool_front/Screens/StartScreen.dart';
import 'package:flutter/material.dart';

class ApplyCheckScreen1 extends StatelessWidget {
  const ApplyCheckScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE6E1EF),
          title: Container(
            padding: EdgeInsets.only(left: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('assets/titleLogo.png', width: 100, scale: 1.3),
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => StartScreen()),
                );
              },
              icon: Icon(
                Icons.home,
                color: Color(0xFF9EA1CA),
              ),
              iconSize: 40,
            )
          ],
        ),
        body: Container(
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
                                        fontSize: 13, color: Color(0xFF000000)),
                                    child: Text('출발')),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, left: 10),
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFF000000)),
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
                                        fontSize: 13, color: Color(0xFF000000)),
                                    child: Text('도착')),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, left: 10),
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFF000000)),
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
                                        fontSize: 13, color: Color(0xFF000000)),
                                    child: Text('날짜')),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, left: 10),
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFF000000)),
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
                                        fontSize: 13, color: Color(0xFF000000)),
                                    child: Text('시간')),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, left: 10),
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFF000000)),
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
                                        fontSize: 13, color: Color(0xFF000000)),
                                    child: Text('인원')),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, left: 10),
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFF000000)),
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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: DefaultTextStyle(
                    style: TextStyle(fontSize: 30, color: Color(0xFF9EA1CA)),
                    child: Text('신청자 리스트')),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  itemCount: 10,
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
                                          child: Text(
                                              '정*기') //Text(nameController.text),
                                          ),
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
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 23,
                                                    width: 60,
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xFF9EA1CA)),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text('출발')),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    margin: EdgeInsets.only(
                                                        top: 3, left: 10),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text(
                                                            '아시아드경기장(공촌사거리)')),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 23,
                                                    width: 60,
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xFF9EA1CA)),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text('출발')),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    margin: EdgeInsets.only(
                                                        top: 3, left: 10),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text('신논현역')),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 23,
                                                    width: 60,
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xFF9EA1CA)),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text('출발')),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    margin: EdgeInsets.only(
                                                        top: 3, left: 10),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text('용인대')),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 23,
                                                    width: 60,
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xFF9EA1CA)),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text('출발')),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    margin: EdgeInsets.only(
                                                        top: 3, left: 10),
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000)),
                                                        child: Text('용인대')),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 23,
                                                  width: 60,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFF9EA1CA)),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text('도착')),
                                                ),
                                                Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text('용인대')),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 23,
                                                  width: 60,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFF9EA1CA)),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text('도착')),
                                                ),
                                                Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text('용인대')),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 23,
                                                  width: 60,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFF9EA1CA)),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text('도착')),
                                                ),
                                                Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text(
                                                          '아시아드경기장(공촌사거리)')),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 23,
                                                  width: 60,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFF9EA1CA)),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text('도착')),
                                                ),
                                                Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: DefaultTextStyle(
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xFF000000)),
                                                      child: Text('용인대')),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))
                                      ],
                                    )
                                  ],
                                )),
                          )),
                    );
                  },
                ),
              )
            ],
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
}
