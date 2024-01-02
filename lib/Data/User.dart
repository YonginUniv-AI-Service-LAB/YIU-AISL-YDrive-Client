class User {
  final String email;
  final String? carNum;

  User({required this.email, this.carNum});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      carNum: json['carNum'],
    );
  }
}