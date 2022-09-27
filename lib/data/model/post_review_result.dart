import 'package:restaurant_app/data/model/customer_review.dart';

class PostReviewResult {
  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  PostReviewResult(
      {required this.error,
      required this.message,
      required this.customerReviews});

  factory PostReviewResult.fromJson(Map<String, dynamic> json) {
    return PostReviewResult(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReview>.from(json["customerReviews"]
            .map((json) => CustomerReview.fromJson(json))));
  }
}
