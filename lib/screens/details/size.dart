import 'package:flutter/material.dart';
import 'package:pizza_app/components/text_toggle_buttons.dart';

class Size extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          TextToggleButtons(
            texts: [
              'Small',
              'Medium',
              'Large',
            ],
            isSelected: [
              true,
              false,
              false,
            ],
            onPressed: (int index) {},
          ),
        ],
      ),
    );
  }
}
