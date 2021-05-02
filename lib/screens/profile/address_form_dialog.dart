import 'package:flutter/material.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/address.dart';

class AddressFormDialog extends StatefulWidget {
  @override
  _AddressFormDialogState createState() => _AddressFormDialogState();
}

class _AddressFormDialogState extends State<AddressFormDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Creates a dialog
    return SimpleDialog(
      title: Container(
        child: Text(PizzaAppLocalizations.of(context)!.addAddressDialogTitle),
        alignment: Alignment.center,
      ),
      contentPadding: EdgeInsets.all(10),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: PizzaAppLocalizations.of(context)!.city,
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return PizzaAppLocalizations.of(context)!.mandatoryField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(
                  labelText: PizzaAppLocalizations.of(context)!.street,
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return PizzaAppLocalizations.of(context)!.mandatoryField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _houseNumberController,
                decoration: InputDecoration(
                  labelText: PizzaAppLocalizations.of(context)!.houseNumber,
                ),
                cursorColor: Colors.red,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return PizzaAppLocalizations.of(context)!.mandatoryField;
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: Colors.red[200],
                    child: Text(PizzaAppLocalizations.of(context)!.cancel),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop(
                          Address(
                              city: _cityController.value.text,
                              street: _streetController.value.text,
                              houseNumber: _houseNumberController.value.text),
                        );
                      }
                    },
                    textColor: Colors.red,
                    child: Text(PizzaAppLocalizations.of(context)!.save),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
