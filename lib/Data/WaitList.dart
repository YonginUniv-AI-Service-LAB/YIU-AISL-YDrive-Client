import 'package:aisl_carpool_front/Data/Carpool.dart';

class WaitList {
  final String guest;
  final int waitNum;
  final int carpoolNum;
  final String owner;

  WaitList(
      {required this.guest,
      required this.waitNum,
      required this.carpoolNum,
      required this.owner});

  factory WaitList.fromJson(Map<dynamic, dynamic> json) {
    return WaitList(
        guest: json['guest'],
        waitNum: json['waitNum'],
        carpoolNum: json['carpoolNum']['carpoolNum'],
        owner: json['owner']);
  }
}
