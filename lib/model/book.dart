import 'package:bookclubs/model/rating_reviews.dart';

class Book {
  final String author;
  final String imageUrl;
  final int pages;
  final List<RatingReview>? ratingsAndReviews;
  final String? summary;
  final String title;

  Book({
    required this.author,
    required this.imageUrl,
    required this.pages,
    this.ratingsAndReviews,
    this.summary,
    required this.title,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      author: json['author'],
      imageUrl: json['imageUrl'],
      pages: json['pages'],
      ratingsAndReviews: json['ratings_and_reviews'] != null
          ? (json['ratings_and_reviews'] as List?)
              ?.map((ratingReview) => RatingReview.fromJson(ratingReview))
              .toList()
          : null,
      summary: json['summary'],
      title: json['title'],
    );
  }
}