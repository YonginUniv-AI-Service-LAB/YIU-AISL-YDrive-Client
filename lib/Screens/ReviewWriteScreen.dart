import 'package:flutter/material.dart';

class ReviewWriteScreen extends StatelessWidget {
  const ReviewWriteScreen({super.key});

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
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(80),
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star,
                        color: Color(0xFF9EA1CA),
                      ),
                      iconSize: 25,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star,
                        color: Color(0xFF9EA1CA),
                      ),
                      iconSize: 25,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star,
                        color: Color(0xFF9EA1CA),
                      ),
                      iconSize: 25,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        color: Color(0xFF9EA1CA),
                      ),
                      iconSize: 25,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        color: Color(0xFF9EA1CA),
                      ),
                      iconSize: 25,
                    )
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
                          width: 400,
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFF000000)),
                              child: Text(
                                  '차에서 불쾌한 냄새가 나고 사람들이 너무 시끄러웠어요. 그리고 aiservicelab 파이팅입니다.')),
                        )
                      ],
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 400,
                child: DefaultTextStyle(
                    style: TextStyle(fontSize: 12, color: Color(0xFF000000)),
                    child: Text('상대방에 대한 악의적인 비방 내용은 리뷰 작성시 불이익이 발생할 수 있습니다.')),
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
                        child: Text('메인화면'))),
                    onPressed: () {},
                  ),
                ),
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
                        child: Text('작성하기'))),
                    onPressed: () {},
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
