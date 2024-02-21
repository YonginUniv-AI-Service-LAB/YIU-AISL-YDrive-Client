// import 'package:aisl_carpool_front/Screens/MyPageScreen.dart';
// import 'package:flutter/material.dart';
//
// import '../Data/Carpool.dart';
//
// class CheckDetailScreen_guest extends StatefulWidget {
//   final Carpool carpool;
//
//   CheckDetailScreen_guest({required this.carpool});
//
//   _CheckDetailScreen_guest createState() => _CheckDetailScreen_guest();
// }
//
// class _CheckDetailScreen_guest extends State<CheckDetailScreen_guest> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xffE6E1EF),
//           leading: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.notifications_none,
//               color: Color(0xFF9EA1CA),
//             ),
//             iconSize: 40,
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   Image.asset('assets/titleLogo.png', width: 80, scale: 1.3),
//                   DefaultTextStyle(
//                       style: TextStyle(fontSize: 40, color: Color(0xFF9EA1CA)),
//                       child: Text('Y')),
//                   DefaultTextStyle(
//                       style: TextStyle(fontSize: 40, color: Color(0xffFFFFFF)),
//                       child: Text('DRIVE')),
//                 ],
//               ),
//             ],
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => MyPageScreen()),
//                 );
//               },
//               icon: Icon(
//                 Icons.person,
//                 color: Color(0xFF9EA1CA),
//               ),
//               iconSize: 40,
//             )
//           ],
//         ),
//         body: SafeArea(
//           child: Container(
//             color: Colors.white,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(15),
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Color(0xFF9EA1CA),
//                           ),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(bottom: 10, top: 10),
//                                 child: DefaultTextStyle(
//                                   style: TextStyle(
//                                       fontSize: 17, color: Color(0xFF000000)),
//                                   child: Text('경로정보'),
//                                 ),
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 23,
//                                     width: 60,
//                                     margin: EdgeInsets.only(bottom: 10),
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Color(0xFF9EA1CA)),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('출발')),
//                                   ),
//                                   Container(
//                                     width: 70,
//                                     margin: EdgeInsets.only(top: 3, left: 10),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('신논현역')),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(bottom: 10, left: 25),
//                                 child: DefaultTextStyle(
//                                   style: TextStyle(
//                                       fontSize: 17, color: Color(0xFF000000)),
//                                   child: Text('↓'),
//                                 ),
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 23,
//                                     width: 60,
//                                     margin: EdgeInsets.only(bottom: 20),
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Color(0xFF9EA1CA)),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('도착')),
//                                   ),
//                                   Container(
//                                     width: 70,
//                                     margin: EdgeInsets.only(top: 3, left: 10),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('용인대')),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                           Expanded(
//                               child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                   bottom: 10,
//                                 ),
//                                 child: DefaultTextStyle(
//                                     style: TextStyle(
//                                         fontSize: 17, color: Color(0xFF000000)),
//                                     child: Text(
//                                         '카풀 세부 정보') //Text(nameController.text),
//                                     ),
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 23,
//                                     width: 60,
//                                     margin: EdgeInsets.only(bottom: 10),
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Color(0xFF9EA1CA)),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('날짜')),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(top: 3, left: 10),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('23년 12월 25일')),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 23,
//                                     width: 60,
//                                     margin: EdgeInsets.only(bottom: 10),
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Color(0xFF9EA1CA)),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('시간')),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(top: 3, left: 10),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('09시 25분')),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     height: 23,
//                                     width: 60,
//                                     margin: EdgeInsets.only(bottom: 10),
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Color(0xFF9EA1CA)),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('인원')),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(top: 3, left: 10),
//                                     child: DefaultTextStyle(
//                                         style: TextStyle(
//                                             fontSize: 13,
//                                             color: Color(0xFF000000)),
//                                         child: Text('3명')),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 100,
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         backgroundColor: Color(0xffC1BDDA),
//                         side: BorderSide(width: 1.0, color: Color(0xffC1BDDA)),
//                       ),
//                       child: (DefaultTextStyle(
//                           style:
//                               TextStyle(fontSize: 15, color: Color(0xFF000000)),
//                           child: Text('신청하기'))),
//                       onPressed: () {},
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 30, left: 5),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(left: 10),
//                           child: DefaultTextStyle(
//                             style: TextStyle(
//                                 fontSize: 25, color: Color(0xFF9EA1CA)),
//                             child: Text('차주 Review'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     primary: false,
//                     padding: EdgeInsets.only(top: 10, left: 15, right: 15),
//                     itemCount: 7,
//                     itemBuilder: (BuildContext ctx, int idx) {
//                       return Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Color(0xFF9EA1CA),
//                                 ),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.star,
//                                           color: Color(0xFF9EA1CA),
//                                         ),
//                                         iconSize: 25,
//                                       ),
//                                       IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.star,
//                                           color: Color(0xFF9EA1CA),
//                                         ),
//                                         iconSize: 25,
//                                       ),
//                                       IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.star,
//                                           color: Color(0xFF9EA1CA),
//                                         ),
//                                         iconSize: 25,
//                                       ),
//                                       IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.star_border,
//                                           color: Color(0xFF9EA1CA),
//                                         ),
//                                         iconSize: 25,
//                                       ),
//                                       IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.star_border,
//                                           color: Color(0xFF9EA1CA),
//                                         ),
//                                         iconSize: 25,
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       SizedBox(
//                                         width: 360,
//                                         child: DefaultTextStyle(
//                                           style: TextStyle(
//                                               fontSize: 17,
//                                               color: Color(0xFF000000)),
//                                           child: Text(
//                                               '차주 텐션이 감당이 안되서 힘들었는데 심심하지 않게 간 것 같아 되돌아보니 조아욤 날짜'),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
