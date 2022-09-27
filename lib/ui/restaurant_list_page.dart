import 'package:flutter/material.dart';
import 'package:restaurant_app/commons/navigation.dart';
import 'package:restaurant_app/data/model/restaurants_result.dart';
import 'package:restaurant_app/provider/restaurants_provider.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/ui/restaurant_favorites_page.dart';
import 'package:restaurant_app/ui/restaurant_search_page.dart';
import 'package:restaurant_app/ui/settings_page.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatelessWidget {
  static String routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  Widget _restaurantList(BuildContext context, RestaurantsResult data) {
    return ListView.builder(
      itemCount: data.count,
      itemBuilder: (context, index) {
        var restaurant = data.restaurants[index];
        return GestureDetector(
          onTap: () {
            Navigation.intentWithData(
                RestaurantDetailPage.routeName, restaurant.id);
          },
          child: RestaurantCard(restaurant: restaurant),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Restaurants",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                Navigator.pushNamed(context, RestaurantSearchPage.routeName);
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_rounded),
              onPressed: () {
                Navigator.pushNamed(context, RestaurantFavoritesPage.routeName);
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () {
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
            )
          ],
        ),
        body: Consumer<RestaurantsProvider>(
          builder: (context, restaurantsProvider, _) {
            if (restaurantsProvider.resultState == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (restaurantsProvider.resultState == ResultState.hasData) {
              return _restaurantList(
                  context, restaurantsProvider.restaurantsResult);
            } else if (restaurantsProvider.resultState == ResultState.noData) {
              return Center(
                child: Text(
                  restaurantsProvider.message,
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    restaurantsProvider.message,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              );
            }
          },
        ));
  }
}
