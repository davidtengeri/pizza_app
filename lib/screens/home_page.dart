import 'package:flutter/material.dart';
import 'package:pizza_app/screens/home/featured.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/screens/home/today_specials.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              ),
              // Az Expanded widget kitölti a maradék rendelkezésre álló helyet.
              Expanded(
                child: TodaySpecials(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
