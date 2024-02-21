class Carpool {
  final String start;
  final String end;
  final String date;
  final int memberNum;
  final int carpoolNum;
  final String email;
  final String createdAt;

  Carpool({required this.start, required this.end, required this.date, required this. memberNum, required this.carpoolNum, required this.email, required this.createdAt});

  factory Carpool.fromJson(Map<String, dynamic> json) {
    List<String> startParts = json['start'].split(' ');
    String startLocation = startParts.length >= 4 ? '${startParts[2]} ${startParts[3]}' : json['start'];

    List<String> endParts = json['end'].split(' ');
    String endLocation = endParts.length >= 4 ? '${endParts[2]} ${endParts[3]}' : json['end'];

    return Carpool(
        start: startLocation,
        end: endLocation,
        date: json['date'],
        memberNum: json['memberNum'],
        carpoolNum: json['carpoolNum'],
        email: json['email'],
        createdAt: json['createdAt']
    );
  }
}