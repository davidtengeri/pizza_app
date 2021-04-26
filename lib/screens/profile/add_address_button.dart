import 'package:flutter/material.dart';
import 'package:pizza_app/db/profile_repository.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/address.dart';
import 'package:pizza_app/screens/profile/address_form_dialog.dart';
import 'package:provider/provider.dart';

// Manages the address creation
class AddAddressButton extends StatelessWidget {
  final Function onAddressSaved;

  AddAddressButton({
    Key? key,
    required this.onAddressSaved,
  }) : super(key: key);

  Future<void> _addAddress(BuildContext context) async {
    var address = await showDialog<Address>(
      context: context,
      builder: (BuildContext context) => AddressFormDialog(),
    );
    if (address != null) {
      // Get the repository through Provider
      var repository = context.read<ProfileRepository>();
      // Save the address into the DB
      await repository.addAddress(address);
      // Call the callback
      await onAddressSaved();
      // Show info to the user
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(PizzaAppLocalizations.of(context)!.addressSaved),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _addAddress(context);
      },
      backgroundColor: Colors.red,
      child: Icon(Icons.add),
    );
  }
}
