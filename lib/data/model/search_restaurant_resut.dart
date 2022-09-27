import 'package:restaurant_app/data/model/restaurant.dart';

class SearchRestaurantResult {
  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  SearchRestaurantResult(
      {required this.error, required this.founded, required this.restaurants});

  factory SearchRestaurantResult.fromJson(Map<String, dynamic> json) {
    return SearchRestaurantResult(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((json) => Restaurant.fromJson(json))));
  }
}
