import 'package:flutter/material.dart';
import 'package:pizza_app/components/text_toggle_buttons.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';

typedef OnToppingChange = void Function(String topping);

class ExtraToppings extends StatelessWidget {
  final options = [
    'standard',
    'extraCheese',
    'extraSpice',
  ];
  final String topping;
  final OnToppingChange onToppingChange;

  ExtraToppings({Key key, this.topping, this.onToppingChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PizzaAppLocalizations.of(context).toppings,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          TextToggleButtons(
            texts: options
                .map(
                  (option) =>
                      PizzaAppLocalizations.of(context).stringById(option),
                )
                .toList(),
            isSelected: [
              topping == options[0],
              topping == options[1],
              topping == options[2],
            ],
            onPressed: (int index) {
              onToppingChange(options[index]);
            },
          ),
        ],
      ),
    );
  }
}
