import 'package:flutter/material.dart';
import 'package:pizza_app/components/text_toggle_buttons.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';

typedef OnCrustSelect = void Function(String crust);

class Crust extends StatelessWidget {
  final OnCrustSelect onCrustSelect;
  final String crust;

  final options = [
    'standard',
    'garlicRoasted',
    'cheeseBurst',
  ];

  Crust({
    Key? key,
    required this.onCrustSelect,
    required this.crust,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PizzaAppLocalizations.of(context).crust,
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
              crust == options[0],
              crust == options[1],
              crust == options[2],
            ],
            onPressed: (int index) {
              onCrustSelect(options[index]);
            },
          ),
        ],
      ),
    );
  }
}
