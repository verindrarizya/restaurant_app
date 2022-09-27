import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/icon_text.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: restaurant.id,
              child: Image.network(
                  "${Restaurant.picMediumResolution}${restaurant.pictureId}"),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconText(
                    icon: Icons.location_on,
                    color: Colors.redAccent,
                    iconSize: 18.0,
                    text: restaurant.city,
                    textStyle: Theme.of(context).textTheme.subtitle2,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            RatingBar.builder(
              itemSize: 20.0,
              initialRating: restaurant.rating.toDouble(),
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) {
                return const Icon(Icons.star, color: Colors.amber);
              },
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
      ),
    );
  }
}
