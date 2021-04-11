import 'package:flutter/material.dart';
import 'package:pizza_app/components/rating.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/screens/home_page.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;
  final EdgeInsetsGeometry? padding;
  final OnPizzaSelect? onPizzaSelect;

  const PizzaCard({
    Key? key,
    required this.pizza,
    this.padding,
    this.onPizzaSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: -5,
            offset: Offset(-5, -5),
            blurRadius: 30,
          ),
          BoxShadow(
            color: Colors.grey[900]!.withOpacity(0.3),
            spreadRadius: 2,
            offset: Offset(7, 7),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pizza.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\$${pizza.price!.toStringAsPrecision(4)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Rating(rating: pizza.rating),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      pizza.topping!,
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              onPizzaSelect!(pizza);
            },
            child: Text(
              'Add to cart',
            ),
            color: Colors.red,
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ],
      ),
    );
  }
}
