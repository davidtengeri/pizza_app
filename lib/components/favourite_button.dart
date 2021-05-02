import 'package:flutter/material.dart';
import 'package:pizza_app/models/favourites.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:provider/provider.dart';

class FavouriteButton extends StatelessWidget {
  final Pizza pizza;

  const FavouriteButton({
    Key? key,
    required this.pizza,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var favourites = context.watch<Favourites>();

    return GestureDetector(
      onTap: () {
        favourites.isFavourite(pizza)
            ? favourites.remove(pizza)
            : favourites.add(pizza);
      },
      child: Icon(
        favourites.isFavourite(pizza) ? Icons.favorite : Icons.favorite_border,
        size: 20,
      ),
    );
  }
}
