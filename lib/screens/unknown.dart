import 'package:flutter/material.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';

class Unknown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(PizzaAppLocalizations.of(context)!.unknown),
          ],
        ),
      ),
    );
  }
}
