class RatingReview {
  final int rating;
  final String review;
  final int userId;
  final String username;

  RatingReview({
    required this.rating,
    required this.review,
    required this.userId,
    required this.username,
  });

  factory RatingReview.fromJson(Map<String, dynamic> json) {
    return RatingReview(
      rating: json['rating'],
      review: json['review'],
      userId: json['user_id'],
      username: json['username'],
    );
  }
}