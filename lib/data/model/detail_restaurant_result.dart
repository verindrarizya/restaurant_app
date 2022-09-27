import 'package:restaurant_app/data/model/restaurant.dart';

class DetailRestaurantResult {
  final bool error;
  final String message;
  final Restaurant restaurant;

  DetailRestaurantResult(
      {required this.error, required this.message, required this.restaurant});

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) {
    return DetailRestaurantResult(
        error: json["error"],
        message: json["message"],
        restaurant: Restaurant.fromJson(json["restaurant"]));
  }
}
