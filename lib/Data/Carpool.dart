class Carpool {
  final String start;
  final String end;
  final String date;
  final int memberNum;
  final int carpoolNum;
  final String email;

  Carpool({required this.start, required this.end, required this.date, required this. memberNum, required this.carpoolNum, required this.email});

  factory Carpool.fromJson(Map<String, dynamic> json) {
    return Carpool(
      start: json['start'],
      end: json['end'],
      date: json['date'],
      memberNum: json['memberNum'],
      carpoolNum: json['carpoolNum'],
      email: json['email']
    );
  }
}