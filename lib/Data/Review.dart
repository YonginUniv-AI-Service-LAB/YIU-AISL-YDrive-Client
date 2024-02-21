class Review {
  final int star;
  final String review;

  Review({required this.star, required this.review});

  factory Review.fromJson(Map<dynamic, dynamic> json) {
    return Review(star: json['star'], review: json['review']);
  }
}