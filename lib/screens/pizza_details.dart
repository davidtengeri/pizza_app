import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/components/amount_selector.dart';
import 'package:pizza_app/components/max_width_button.dart';
import 'package:pizza_app/screens/details/crust.dart';
import 'package:pizza_app/screens/details/extra_toppings.dart';
import 'package:pizza_app/screens/details/size.dart';
import 'package:pizza_app/screens/details/size_selector_buttons.dart';
import 'package:pizza_app/screens/details/topping.dart';
import 'package:pizza_app/screens/details/total.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/components/rating.dart';

class PizzaDetails extends StatelessWidget {
  const PizzaDetails({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Details',
          style: TextStyle(color: Colors.grey[900]),
        ),
        leading: BackButton(
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizeSelectorButtons(
                      image: Image.asset(pizza.imagePath!),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pizza.name!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Rating(
                        rating: pizza.rating,
                      ),
                      AmountSelector(
                        amount: 1,
                        amountChange: (int amount) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                Topping(
                  topping: pizza.topping,
                ),
                Size(),
                Crust(),
                ExtraToppings(),
              ],
            )),
            Total(
              totalPrice: pizza.price,
            ),
            MaxWidthButton(
              text: 'Add to cart',
              onPressed: () {
                context.go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
