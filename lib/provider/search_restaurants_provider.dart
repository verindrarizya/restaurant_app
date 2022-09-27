import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/search_restaurant_resut.dart';
import 'package:restaurant_app/utils/result_state.dart';

class SearchRestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantsProvider({required this.apiService});

  late SearchRestaurantResult _searchRestaurantResult;
  ResultState _resultState = ResultState.noData;
  String _message = "";

  SearchRestaurantResult get searchRestaurantResult => _searchRestaurantResult;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future<dynamic> fetchSearchRestaurants({required String query}) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final result = await apiService.getSearchRestaurant(query: query);

      if (result.error) {
        _resultState = ResultState.error;
        notifyListeners();
        return _message =
            "Something gone wrong while fetching data. Please wait a bit and try again later";
      } else if (result.founded == 0) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message =
            "There are no restaurants related to this keyword: $query";
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _searchRestaurantResult = result;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message =
          "Something gone wrong while fetching data. Please check your internet connection";
    }
  }
}
