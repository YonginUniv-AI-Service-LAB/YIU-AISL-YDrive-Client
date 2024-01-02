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
            backgroundColor: Color(0xffB9BADA),
            title: Container(
                child: Container(
              padding: EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  Image.asset('assets/titleLogo.png', width: 100, scale: 1.3),
                  DefaultTextStyle(
                      style: TextStyle(fontSize: 40, color: Color(0xFF9EA1CA)),
                      child: Text('Y')),
                  DefaultTextStyle(
                      style: TextStyle(fontSize: 40, color: Color(0xffFFFFFF)),
                      child: Text('DRIVE')),
                ],
              ),
            )),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffB9BADA), Colors.white])),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 80),
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
                                            color: Color(0xFF9EA1CA)),
                                        child: Text('강남역 3번 출구'),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF9EA1CA)),
                                        child: Text(' -> '),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF9EA1CA)),
                                        child: Text('용인대학교'),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 17, color: Color(0xFF9EA1CA)),
                                    child: Text('11.02(목) 07:00'),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 17, color: Color(0xFF9EA1CA)),
                                    child: Text('남은 인원 : 3명'),
                                  ),
                                ),
                              ],
                            )),
                      )),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/Air.png',
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
                      style: TextStyle(fontSize: 15, color: Color(0xFF9EA1CA)),
                      child: Text('목적지로 이동중입니다. 도착하면 도착완료 버튼을 눌러주세요.')),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                      ),
                      child: (Text('도착완료')),
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
