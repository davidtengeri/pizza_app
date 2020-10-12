import 'package:flutter/material.dart';
import 'package:pizza_app/components/text_toggle_buttons.dart';

class ExtraToppings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Toppings',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          TextToggleButtons(
            texts: [
              'Standard',
              'Extra Cheese',
              'Extra Spice',
            ],
            isSelected: [
              false,
              true,
              false,
            ],
            onPressed: (int index) {},
          ),
        ],
      ),
    );
  }
}
