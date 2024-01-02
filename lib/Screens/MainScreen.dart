import 'package:aisl_carpool_front/Screens/JoinScreen.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              padding: EdgeInsets.only(bottom: 50),
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
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) => LoginScreen()
                      ),
                    );
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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) => JoinScreen()
                        ),
                      );
                    },)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );  //MaterialApp
  }
}
