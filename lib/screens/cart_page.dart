import 'package:flutter/material.dart';
import 'package:pizza_app/components/cart_button.dart';
import 'package:pizza_app/components/profile_button.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/cart.dart';
import 'package:pizza_app/screens/cart/cart_item_card.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final void Function() onShowProfile;

  const CartPage({Key? key, required this.onShowProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          PizzaAppLocalizations.of(context)!.cart,
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          CartButton(
            iconColor: Colors.black,
            onPressed: () {},
          ),
          ProfileButton(
            iconColor: Colors.black,
            onPressed: onShowProfile,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: cart.items
                    .map(
                      (item) => CartItemCard(
                        item: item,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      PizzaAppLocalizations.of(context)!.total,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '\$${cart.total.toStringAsPrecision(4)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
