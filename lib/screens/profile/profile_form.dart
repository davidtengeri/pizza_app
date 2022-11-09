import 'package:flutter/material.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/screens/profile/address_card.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatefulWidget {
  // final Profile profile;

  ProfileForm({
    Key? key,
    // required this.profile,
  }) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  // These controllers can be used to get the value entered into the input field
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController.fromValue(
        TextEditingValue(text: /*widget.profile.name ??*/ ''));
    _emailController = TextEditingController.fromValue(
        TextEditingValue(text: /*widget.profile.email ??*/ ''));
    _phoneController = TextEditingController.fromValue(
        TextEditingValue(text: /*widget.profile.phone ??*/ ''));
  }

  void saveProfile() {
    // final profileRepository = context.read<ProfileRepository>();
    // final profile = profileRepository.profile;
    // profile.name = _nameController.text;
    // profile.email = _emailController.text;
    // profile.phone = _phoneController.text;
    // profileRepository.update(profile);

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(PizzaAppLocalizations.of(context)!.profileSaved),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                PizzaAppLocalizations.of(context)!.profile,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText:
                            PizzaAppLocalizations.of(context)!.enterYourName,
                        labelText: PizzaAppLocalizations.of(context)!.name,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return PizzaAppLocalizations.of(context)!
                              .mandatoryField;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText:
                            PizzaAppLocalizations.of(context)!.enterYourEmail,
                        labelText: PizzaAppLocalizations.of(context)!.email,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return PizzaAppLocalizations.of(context)!
                              .mandatoryField;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText:
                            PizzaAppLocalizations.of(context)!.enterYourPhone,
                        labelText: PizzaAppLocalizations.of(context)!.phone,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return PizzaAppLocalizations.of(context)!
                              .mandatoryField;
                        }
                        return null;
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveProfile();
                          }
                        },
                        child: Text(PizzaAppLocalizations.of(context)!.save),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                PizzaAppLocalizations.of(context)!.addresses,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // if (widget.profile.addresses.length > 0)
            //   ...widget.profile.addresses
            //       .map((address) => AddressCard(address: address))
            //       .toList()
          ],
        ),
      ),
    );
  }
}
