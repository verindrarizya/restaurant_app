import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/commons/navigation.dart';
import 'package:restaurant_app/provider/search_restaurants_provider.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';

class RestaurantSearchPage extends StatefulWidget {
  static const routeName = "/restaurant_search";

  const RestaurantSearchPage({Key? key}) : super(key: key);

  @override
  State<RestaurantSearchPage> createState() => _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends State<RestaurantSearchPage> {
  String query = "";

  @override
  void initState() {
    super.initState();
  }

  AppBar _searchAppbar(BuildContext context) {
    return AppBar(
      title: Text("Search Restaurants",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer<SearchRestaurantsProvider>(
                  builder: (context, data, _) {
                    return TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search_rounded)),
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: (text) {
                        setState(() {
                          if (text.isNotEmpty) {
                            data.fetchSearchRestaurants(query: text);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<SearchRestaurantsProvider>(
      builder: (context, searchRestaurantProvider, _) {
        if (searchRestaurantProvider.resultState == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (searchRestaurantProvider.resultState == ResultState.error) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                searchRestaurantProvider.message,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          );
        } else if (searchRestaurantProvider.resultState == ResultState.noData) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                searchRestaurantProvider.message,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: searchRestaurantProvider.searchRestaurantResult.founded,
            itemBuilder: (context, index) {
              final restaurant = searchRestaurantProvider
                  .searchRestaurantResult.restaurants[index];
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchAppbar(context),
      body: _buildBody(context),
    );
  }
}
