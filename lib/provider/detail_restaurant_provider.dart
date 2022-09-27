import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/customer_review.dart';
import 'package:restaurant_app/data/model/detail_restaurant_result.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _fetchDetailRestaurant(id: id);
  }

  late DetailRestaurantResult _detailRestaurantResult;
  late List<CustomerReview> _customerReviews;
  late ResultState _resultState;
  late ResultState _postReviewState;
  String _message = "";

  String get message => _message;
  DetailRestaurantResult get detailRestaurantResult => _detailRestaurantResult;
  List<CustomerReview> get customerReviews => _customerReviews;
  ResultState get resultState => _resultState;
  ResultState get postReviewState => _postReviewState;

  Future<dynamic> _fetchDetailRestaurant({required String id}) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final result = await apiService.getDetailRestaurant(id: id);

      if (result.error) {
        _resultState = ResultState.error;
        notifyListeners();
        return _message = result.message;
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        _customerReviews = result.restaurant.customerReviews!;
        notifyListeners();
        return _detailRestaurantResult = result;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message =
          "Something gone wrong while fetching data. Please check your internet connection";
    }
  }

  Future<String> postNewReview(
      {required String id,
      required String name,
      required String review}) async {
    try {
      _postReviewState = ResultState.loading;
      notifyListeners();
      final result =
          await apiService.postReview(id: id, name: name, review: review);

      if (result.error) {
        _postReviewState = ResultState.error;
        notifyListeners();
        return result.message;
      } else {
        _postReviewState = ResultState.hasData;
        notifyListeners();
        _customerReviews = result.customerReviews;
        notifyListeners();
        return "Success";
      }
    } catch (e) {
      _postReviewState = ResultState.error;
      notifyListeners();
      return "Something went wrong, please check your internet connection";
    }
  }
}
