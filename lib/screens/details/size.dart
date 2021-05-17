import 'package:flutter/material.dart';
import 'package:pizza_app/components/text_toggle_buttons.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';

typedef OnSizeChange = void Function(String size);

class Size extends StatelessWidget {
  final options = [
    'small',
    'medium',
    'large',
  ];

  final String size;
  final OnSizeChange onSizeChange;

  Size({
    Key? key,
    required this.size,
    required this.onSizeChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PizzaAppLocalizations.of(context)!.size,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          TextToggleButtons(
            texts: options
                .map(
                  (option) =>
                      PizzaAppLocalizations.of(context)!.stringById(option),
                )
                .toList(),
            isSelected: [
              size == options[0],
              size == options[1],
              size == options[2],
            ],
            onPressed: (int index) {
              onSizeChange(options[index]);
            },
          ),
        ],
      ),
    );
  }
}
