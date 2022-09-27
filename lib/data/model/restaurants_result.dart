import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantsResult {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantsResult(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  factory RestaurantsResult.fromJson(Map<String, dynamic> json) {
    return RestaurantsResult(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((json) => Restaurant.fromJson(json))));
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
      "count": count,
      "restaurants": restaurants
    };
  }
}
