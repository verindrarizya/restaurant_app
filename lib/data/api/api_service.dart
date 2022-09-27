import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/post_review_result.dart';
import 'package:restaurant_app/data/model/detail_restaurant_result.dart';
import 'package:restaurant_app/data/model/restaurants_result.dart';
import 'package:restaurant_app/data/model/search_restaurant_resut.dart';

class ApiService {
  static const String baseUrl = "https://restaurant-api.dicoding.dev/";

  http.Client? client;

  ApiService({this.client}) {
    client ??= http.Client();
  }

  Future<RestaurantsResult> getListRestaurant() async {
    final response = await client!.get(Uri.parse("${baseUrl}list"));
    if (response.statusCode == 200) {
      return RestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load list of restaurants");
    }
  }

  Future<DetailRestaurantResult> getDetailRestaurant(
      {required String id}) async {
    final response = await client!.get(Uri.parse("${baseUrl}detail/$id"));
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load detail of restaurant with id: $id");
    }
  }

  Future<SearchRestaurantResult> getSearchRestaurant(
      {required String query}) async {
    final response = await client!.get(Uri.parse("${baseUrl}search?q=$query"));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          "Failed to load list of restaurants with keyword: $query");
    }
  }

  Future<PostReviewResult> postReview(
      {required String id,
      required String name,
      required String review}) async {
    final headers = {"Content-Type": "application/json"};
    final newReview = {"id": id, "name": name, "review": review};
    final response = await client!.post(Uri.parse("${baseUrl}review"),
        headers: headers, body: jsonEncode(newReview));

    if (response.statusCode == 201) {
      return PostReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to post a new review");
    }
  }
}
