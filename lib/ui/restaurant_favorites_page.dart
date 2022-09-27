import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/commons/navigation.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';

class RestaurantFavoritesPage extends StatelessWidget {
  static String routeName = "/restaurant_favorites";

  const RestaurantFavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Restaurants",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, _) {
          if (databaseProvider.resultState == ResultState.noData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  databaseProvider.message,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: databaseProvider.favoriteRestaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = databaseProvider.favoriteRestaurants[index];
                  return GestureDetector(
                      onTap: () {
                        Navigation.intentWithData(
                            RestaurantDetailPage.routeName, restaurant.id);
                      },
                      child: RestaurantCard(restaurant: restaurant));
                });
          }
        },
      ),
    );
  }
}
