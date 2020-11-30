import 'package:flutter/material.dart';
import 'package:pizza_app/components/cart_button.dart';
import 'package:pizza_app/components/profile_button.dart';
import 'package:pizza_app/screens/home/featured.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/screens/home/today_specials.dart';

typedef OnPizzaSelect = void Function(Pizza pizza);

class HomePage extends StatelessWidget {
  final OnPizzaSelect onPizzaSelect;
  final void Function() onShowProfile;
  final void Function() onShowCart;

  const HomePage({
    Key key,
    this.onPizzaSelect,
    this.onShowProfile,
    this.onShowCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Pizza App'),
          actions: [
            CartButton(
              onPressed: onShowCart,
            ),
            ProfileButton(
              onPressed: onShowProfile,
            ),
          ],
        ),
        // A Container egy általános tároló elem, amivel könnyen lehet méretezni,
        // színezni a tartalmát
        body: Container(
          // A megjelenését a BoxDecoration írja le, amiben azt tudjuk megmondani,
          // hogyan rajzolja ki a Container dobozát
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          // A Column egy elrendezéshez használható widget. Az elemei egymás alá
          // kerülnek
          child: Column(
            children: [
              Featured(
                pizza: PIZZAS.last,
                onPizzaSelect: onPizzaSelect,
              ),
              // Az Expanded widget kitölti a maradék rendelkezésre álló helyet.
              Expanded(
                child: TodaySpecials(
                  onPizzaSelect: onPizzaSelect,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
