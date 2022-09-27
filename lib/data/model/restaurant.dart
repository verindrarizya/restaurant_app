import 'package:restaurant_app/data/model/category.dart';
import 'package:restaurant_app/data/model/customer_review.dart';

import 'package:restaurant_app/data/model/menu.dart';

class Restaurant {
  static const String picMediumResolution =
      "https://restaurant-api.dicoding.dev/images/medium/";

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  List<Category>? categories;
  Menu? menus;
  List<CustomerReview>? customerReviews;

  // menus => foods, drinks
  // customerReviews

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      this.categories,
      this.menus,
      this.customerReviews});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((json) => Category.fromJson(json))),
        menus: json["menus"] == null ? null : Menu.fromJson(json["menus"]),
        customerReviews: json["customerReviews"] == null
            ? null
            : List<CustomerReview>.from(json["customerReviews"]
                .map((json) => CustomerReview.fromJson(json))));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "pictureId": pictureId,
      "city": city,
      "rating": rating
    };
  }
}
