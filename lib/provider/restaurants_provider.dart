import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurants_result.dart';
import 'package:restaurant_app/utils/result_state.dart';

class RestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantsProvider({required this.apiService}) {
    _fetchRestaurants();
  }

  late RestaurantsResult _restaurantsResult;
  late ResultState _resultState;
  String _message = "";

  String get message => _message;
  RestaurantsResult get restaurantsResult => _restaurantsResult;
  ResultState get resultState => _resultState;

  Future<dynamic> _fetchRestaurants() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final result = await apiService.getListRestaurant();

      if (result.restaurants.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = "There are no restaurants available right now";
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _restaurantsResult = result;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message =
          "Something gone wrong while fetching data. Please check your internet connection";
    }
  }
}
