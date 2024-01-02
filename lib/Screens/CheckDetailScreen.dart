import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
import 'package:flutter/material.dart';

class CheckDetailScreen1 extends StatelessWidget {
  const CheckDetailScreen1({super.key});

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
                padding: EdgeInsets.only(bottom: 10, top: 30),
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF9EA1CA),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //       builder: (BuildContext context) =>
                            //           PostDetailScreen()),
                            // );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF9EA1CA)),
                                      child: Text('이름'),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 205),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF9EA1CA)),
                                      child: Text('정*기'),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                      fontSize: 17, color: Color(0xFF9EA1CA)),
                                  child: Text('이용내역'),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF9EA1CA)),
                                      child: Text('23.01.21'),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF9EA1CA)),
                                      child: Text('강남역'),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF9EA1CA)),
                                      child: Text('23.01.21'),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFF9EA1CA)),
                                      child: Text('강남역'),
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
                            ],
                          )),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: DefaultTextStyle(
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFF9EA1CA)),
                        child: Text('탑승자 Review'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  itemCount: 7,
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
                                    Row(
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
                                            Icons.star,
                                            color: Color(0xFFffffff),
                                          ),
                                          iconSize: 25,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star,
                                            color: Color(0xFFffffff),
                                          ),
                                          iconSize: 25,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFF9EA1CA)),
                                          child: Text(
                                              '차주 텐션이 감당이 안되서 힘들었는데 심심하지\n 않게 간 것 같아 되돌아보니 조아욤 날짜'),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          )),
                    );
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 100,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                    ),
                    child: (Text('거절하기')),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
                    ),
                    child: (Text('수락하기')),
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
