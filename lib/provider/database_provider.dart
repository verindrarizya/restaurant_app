import 'package:flutter/material.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavRestaurants();
  }

  late ResultState _resultState;
  String _message = "";
  List<Restaurant> _favoriteRestaurants = [];

  ResultState get resultState => _resultState;
  String get message => _message;
  List<Restaurant> get favoriteRestaurants => _favoriteRestaurants;

  void _getFavRestaurants() async {
    _resultState = ResultState.loading;
    _favoriteRestaurants = await databaseHelper.getRestaurantsFav();
    if (_favoriteRestaurants.isNotEmpty) {
      _resultState = ResultState.hasData;
    } else {
      _resultState = ResultState.noData;
      _message = "Currently you don't have any favorite restaurant";
    }
    notifyListeners();
  }

  void addFavRestaurant(Restaurant restaurant) async {
    _resultState = ResultState.loading;
    notifyListeners();
    try {
      await databaseHelper.insertRestaurantFav(restaurant);
      _getFavRestaurants();
    } catch (e) {
      _resultState = ResultState.error;
      _message = "Error when adding new favorite restaurant";
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    final favRestaurant = await databaseHelper.getRestaurantFavById(id);
    return favRestaurant.isNotEmpty;
  }

  void removeFavRestaurant(String id) async {
    try {
      await databaseHelper.removeRestaurantFav(id);
      _getFavRestaurants();
    } catch (e) {
      _resultState = ResultState.error;
      _message = "Error when removing favorite restaurant";
      notifyListeners();
    }
  }
}
