import 'package:flutter/material.dart';
import 'package:pizza_app/components/text_toggle_buttons.dart';

class Crust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Crust',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          TextToggleButtons(
            texts: [
              'Standard',
              'Garlic Roasted',
              'Cheese Burst',
            ],
            isSelected: [
              false,
              false,
              true,
            ],
            onPressed: (int index) {},
          ),
        ],
      ),
    );
  }
}
