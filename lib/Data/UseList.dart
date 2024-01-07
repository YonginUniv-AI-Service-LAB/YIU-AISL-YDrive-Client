class UseList {
  final String start;
  final String end;
  final String date;

  UseList({required this.start, required this.end, required this.date});
  factory UseList.fromJson(Map<dynamic, dynamic> json) {
    return UseList(start: json['start'], end: json['end'], date: json['date']);
  }
}