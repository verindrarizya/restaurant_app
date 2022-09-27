import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/customer_review.dart';
import 'package:restaurant_app/data/model/drink.dart';
import 'package:restaurant_app/data/model/food.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/dialog_add_review.dart';
import 'package:restaurant_app/widgets/icon_text.dart';

class RestaurantDetailPage extends StatelessWidget {
  static String routeName = "/restaurant_detail";

  final String id;

  const RestaurantDetailPage({Key? key, required this.id}) : super(key: key);

  Widget _baseDetailScaffold(BuildContext context, {required Widget child}) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.indigo,
      ),
      body: child,
    );
  }

  Widget _sliverAppBar(BuildContext context, {required Restaurant restaurant}) {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, _) {
        return SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: restaurant.id,
                  child: Image.network(
                    "${Restaurant.picMediumResolution}${restaurant.pictureId}",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment.center,
                          colors: [Color(0x60000000), Color(0x00000000)])),
                )
              ],
            ),
            title: Text(restaurant.name,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    )),
            centerTitle: true,
          ),
          actions: [
            FutureBuilder<bool>(
              future: databaseProvider.isFavorite(restaurant.id),
              builder: (context, snapshot) {
                var isFavorite = snapshot.data ?? false;
                if (isFavorite) {
                  return IconButton(
                    icon: const Icon(Icons.favorite_rounded),
                    color: Colors.redAccent,
                    onPressed: () =>
                        databaseProvider.removeFavRestaurant(restaurant.id),
                  );
                } else {
                  return IconButton(
                    icon: const Icon(Icons.favorite_border_rounded),
                    color: Colors.redAccent,
                    onPressed: () =>
                        databaseProvider.addFavRestaurant(restaurant),
                  );
                }
              },
            )
          ],
        );
      },
    );
  }

  Widget _listFoods(BuildContext context, List<Food> foods) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/food.png",
                  height: 24.0,
                  width: 24.0,
                ),
                Text(foods[index].name)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _listDrinks(BuildContext context, List<Drink> drinks) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/drink.png",
                  height: 24.0,
                  width: 24.0,
                ),
                Text(drinks[index].name)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _listCustomerReviews(
      BuildContext context, List<CustomerReview> customerReviews) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: customerReviews.length,
      itemBuilder: (context, index) {
        final customerReview = customerReviews[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 50.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customerReview.name.length > 30
                              ? "${customerReview.name.substring(0, 14)}..."
                              : customerReview.name,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          customerReview.date,
                          style: Theme.of(context).textTheme.overline,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(customerReview.review.length > 38
                    ? "${customerReview.review.substring(0, 30)}..."
                    : customerReview.review)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _detailRestaurant(BuildContext context,
      {required Restaurant restaurant,
      required List<CustomerReview> customerReviews}) {
    var fontScaling = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [_sliverAppBar(context, restaurant: restaurant)];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      itemSize: 26.0,
                      initialRating: restaurant.rating.toDouble(),
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) {
                        return const Icon(Icons.star, color: Colors.amber);
                      },
                      onRatingUpdate: (rating) {},
                    ),
                    IconText(
                      icon: Icons.location_on,
                      color: Colors.redAccent,
                      iconSize: 20.0,
                      text: restaurant.city,
                      textStyle: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  restaurant.description,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Foods",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  height: 100,
                  child: _listFoods(context, restaurant.menus!.foods),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Drinks",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  height: 100,
                  child: _listDrinks(context, restaurant.menus!.drinks),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Customer review",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  height: fontScaling > 1.30 ? 108 : 100,
                  child: _listCustomerReviews(context, customerReviews),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DialogAddReview(id: restaurant.id);
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Add Review",
                          style: Theme.of(context).textTheme.button?.copyWith(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          DetailRestaurantProvider(apiService: ApiService(), id: id),
      child: Consumer<DetailRestaurantProvider>(
        builder: (context, detailRestaurantProvider, _) {
          if (detailRestaurantProvider.resultState == ResultState.loading) {
            return _baseDetailScaffold(context,
                child: const Center(child: CircularProgressIndicator()));
          } else if (detailRestaurantProvider.resultState ==
              ResultState.error) {
            return _baseDetailScaffold(context,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      detailRestaurantProvider.message,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ));
          } else {
            return _detailRestaurant(context,
                restaurant:
                    detailRestaurantProvider.detailRestaurantResult.restaurant,
                customerReviews: detailRestaurantProvider.customerReviews);
          }
        },
      ),
    );
  }
}
