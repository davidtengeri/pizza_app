import 'package:flutter/material.dart';
import 'package:pizza_app/components/cart_button.dart';
import 'package:pizza_app/db/profile_repository.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/profile.dart';
import 'package:pizza_app/screens/profile/add_address_button.dart';
import 'package:pizza_app/screens/profile/profile_form.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile;
  ProfileRepository _profileRepository;

  @override
  void initState() {
    super.initState();
    _profileRepository = context.read<ProfileRepository>();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    var loadedProfile = await _profileRepository.load();
    setState(() {
      _profile = loadedProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            PizzaAppLocalizations.of(context).profile,
            style: TextStyle(color: Colors.grey[900]),
          ),
          actions: [
            CartButton(
              iconColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.account_circle_outlined,
                size: 150,
              ),
              if (_profile != null)
                Expanded(
                  child: ProfileForm(
                    profile: _profile,
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: AddAddressButton(
          onAddressSaved: _loadProfile,
        ),
      ),
    );
  }
}
