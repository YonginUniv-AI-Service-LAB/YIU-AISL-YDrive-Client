class WaitResult {
  final String start;
  final String end;
  final String date;
  final int checkNum;
  final int carpoolNum;
  final int waitNum;

  WaitResult(
      {required this.start,
      required this.end,
      required this.date,
      required this.checkNum,
      required this.carpoolNum,
      required this.waitNum});

  factory WaitResult.fromJson(Map<dynamic, dynamic> json) {
    List<String> startParts = json['carpoolNum']['start'].split(' ');
    String startLocation = startParts.length >= 4
        ? '${startParts[2]} ${startParts[3]}'
        : json['carpoolNum']['start'];

    List<String> endParts = json['carpoolNum']['end'].split(' ');
    String endLocation = endParts.length >= 4
        ? '${endParts[2]} ${endParts[3]}'
        : json['carpoolNum']['end'];
    return WaitResult(
        start: startLocation,
        end: endLocation,
        date: json['carpoolNum']['date'],
        checkNum: json['checkNum'],
        carpoolNum: json['carpoolNum']['carpoolNum'],
        waitNum: json['waitNum']);
  }
}
