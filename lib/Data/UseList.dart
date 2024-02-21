class UseList {
  final String start;
  final String end;
  final String date;

  UseList({required this.start, required this.end, required this.date});
  factory UseList.fromJson(Map<dynamic, dynamic> json) {
    List<String> startParts = json['start'].split(' ');
    String startLocation = startParts.length >= 4 ? '${startParts[2]} ${startParts[3]}' : json['start'];

    List<String> endParts = json['end'].split(' ');
    String endLocation = endParts.length >= 4 ? '${endParts[2]} ${endParts[3]}' : json['end'];
    return UseList(start: startLocation, end: endLocation, date: json['date']);
  }
}