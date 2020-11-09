import 'package:flutter/material.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/address.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  AddressCard({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('${PizzaAppLocalizations.of(context).city}: '),
                Text(address.city),
              ],
            ),
            Row(
              children: <Widget>[
                Text('${PizzaAppLocalizations.of(context).street}: '),
                Text(address.street),
              ],
            ),
            Row(
              children: <Widget>[
                Text('${PizzaAppLocalizations.of(context).houseNumber}: '),
                Text(address.houseNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
