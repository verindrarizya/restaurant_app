import 'package:restaurant_app/data/model/drink.dart';
import 'package:restaurant_app/data/model/food.dart';

class Menu {
  List<Food> foods;
  List<Drink> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
        foods:
            List<Food>.from(json["foods"].map((json) => Food.fromJson(json))),
        drinks: List<Drink>.from(
            json["drinks"].map((json) => Drink.fromJson(json))));
  }
}
