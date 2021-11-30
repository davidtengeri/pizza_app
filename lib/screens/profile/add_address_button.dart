import 'package:flutter/material.dart';
import 'package:pizza_app/hive/address.dart';
import 'package:pizza_app/hive/profile_repository.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/location_service.dart';
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
    final profileRepository = context.read<ProfileRepository>();
    final profile = profileRepository.profile;
    var address = await showDialog<Address>(
      context: context,
      builder: (BuildContext context) => AddressFormDialog(),
    );
    if (address != null) {
      // Get the latitude and longitude values for that address
      address.latLng = await LocationService.find(address);

      profile.addresses.add(address);
      profileRepository.update(profile);
      // Call the callback
      await onAddressSaved();
      // Show info to the user
      ScaffoldMessenger.of(context)
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
