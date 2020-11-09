import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pizza_app/components/amount_selector.dart';
import 'package:pizza_app/components/cart_button.dart';
import 'package:pizza_app/components/max_width_button.dart';
import 'package:pizza_app/components/profile_button.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/cart.dart';
import 'package:pizza_app/models/cart_item.dart';
import 'package:pizza_app/screens/details/crust.dart';
import 'package:pizza_app/screens/details/extra_toppings.dart';
import 'package:pizza_app/screens/details/size.dart';
import 'package:pizza_app/screens/details/size_selector_buttons.dart';
import 'package:pizza_app/screens/details/topping.dart';
import 'package:pizza_app/screens/details/total.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/components/rating.dart';
import 'package:provider/provider.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza pizza;
  final void Function() onShowProfile;

  const PizzaDetails({
    Key key,
    this.pizza,
    this.onShowProfile,
  }) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  String _crust;
  String _size;
  String _topping;
  int _amount = 1;

  @override
  void initState() {
    super.initState();
  }

  void _changeCrust(String crust) {
    setState(() {
      _crust = crust;
    });
  }

  void _changeSize(String size) {
    setState(() {
      _size = size;
    });
  }

  void _changeTopping(String topping) {
    setState(() {
      _topping = topping;
    });
  }

  void _changeAmount(int amount) {
    setState(() {
      _amount = amount;
    });
  }

  void _addPizzaToCart() {
    var cart = context.read<Cart>();
    for (var i = 0; i < _amount; i++) {
      cart.add(
        CartItem(
          pizza: widget.pizza,
          size: _size,
          crust: _crust,
          topping: _topping,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          PizzaAppLocalizations.of(context).details,
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          CartButton(
            iconColor: Colors.black,
          ),
          ProfileButton(
            iconColor: Colors.black,
            onPressed: widget.onShowProfile,
          ),
        ],
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
                      image: Image.asset(widget.pizza.imagePath),
                      size: _size,
                      onSizeChange: _changeSize,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pizza.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Rating(
                        rating: widget.pizza.rating,
                      ),
                      AmountSelector(
                        amount: _amount,
                        amountChange: _changeAmount,
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
                  topping: widget.pizza.topping,
                ),
                Size(
                  size: _size,
                  onSizeChange: _changeSize,
                ),
                Crust(
                  crust: _crust,
                  onCrustSelect: _changeCrust,
                ),
                ExtraToppings(
                  topping: _topping,
                  onToppingChange: _changeTopping,
                ),
              ],
            )),
            Total(
              totalPrice: widget.pizza.price,
            ),
            MaxWidthButton(
              text: PizzaAppLocalizations.of(context).addToCart,
              onPressed: () {
                _addPizzaToCart();
              },
            ),
          ],
        ),
      ),
    );
  }
}
