import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var a = 1;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffB9BADA),
              Colors.white
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/titleLogo.png', width: 100, scale: 1.3, ),
                  DefaultTextStyle(style: TextStyle(
                    fontSize: 40,
                    color: Color(0xffC1BDDA)
                  ), child: Text('Y')
                  ),
                  DefaultTextStyle(style: TextStyle(
                    fontSize: 40,
                    color: Color(0xffFFFFFF)
                  ), child: Text('DRIVE')
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Color(0xffC1BDDA) ),
                    ),
                    child: (
                      Text('LOGIN')
                  ), onPressed:(){
                      a++;
                  },
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(style: TextStyle(
                        fontSize: 13,
                        color: Color(0xffC1BDDA)
                    ), child: Text('계정이 없나요?')
                    ),
                    TextButton(
                      child: (
                        Text('계정 생성하기')
                      ),onPressed: (){
                        a++;
                    },)
                  ],
                )
              ],
            )
          ],
        ),
      ),

/*        bottomNavigationBar: BottomAppBar(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const[
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page)
            ],
          ),
        )*/
       /*Center(
        child: Container(width: 50, height: 50, color: Colors.blue) //네모 박스, SizeBox()와 동잉 LP단위임,*/
      // Image.asset('assets/titleLogo.png') //이미지 위셋
      // Icon(Icons.star) //아이폰 위젯
      // Text('안녕') //텍스트 위젯
    );  //MaterialApp
  }
}
