import 'package:flutter/material.dart';

import 'StartScreen.dart';

class CarpoolScreen extends StatelessWidget {
  const CarpoolScreen({Key? key}) : super(key: key);

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
                          backgroundColor: Color(0xffC1BDDA),
                          side:
                              BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                        ),
                        child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF000000)),
                            child: Text('등교')),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xffffffff),
                          side:
                              BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                        ),
                        child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF000000)),
                            child: Text('하교')),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Container(
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
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF000000)),
                          child: Text('출발지')),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      height: 40,
                      width: 300,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 30,
                            width: 60,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  suffixIconColor: Color(0xFF9EA1CA),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            height: 30,
                            width: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            height: 30,
                            width: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            height: 30,
                            width: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
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
                          child: Text('출발일')),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      height: 40,
                      width: 300,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 30,
                            width: 100,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  suffixIconColor: Color(0xFF9EA1CA),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 20),
                            height: 30,
                            width: 120,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
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
                          child: Text('출발 시간')),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      height: 40,
                      width: 300,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 30,
                            width: 100,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  suffixIconColor: Color(0xFF9EA1CA),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 20),
                            height: 30,
                            width: 120,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9EA1CA)))),
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
                          child: Text('도착지')),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 30,
                      width: 300,
                      child: TextField(
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
                          child: Text('탑승인원')),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 30,
                      width: 300,
                      child: TextField(
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
                        child: Text('탑승인원')),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => StartScreen()),
                      );
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
}
