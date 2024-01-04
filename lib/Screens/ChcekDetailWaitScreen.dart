import 'package:flutter/material.dart';

class CheckDetailWaitScreen extends StatelessWidget {
  const CheckDetailWaitScreen({super.key});

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
        body: Container(
          padding: EdgeInsets.only(top: 200, left: 15, right: 15),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 30),
                child: Container(
                    height: 150,
                    width: 400,
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF9EA1CA),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 400,
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFF000000)),
                              child: Text(
                                  '카풀 준비가 완료되었습니다. 카풀 시작 버튼을 눌러 카풀을 진행하세요.')),
                        )
                      ],
                    )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 100,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xffC1BDDA),
                      side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                    ),
                    child: (DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF000000)),
                        child: Text('카풀시작'))),
                    onPressed: () {},
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
