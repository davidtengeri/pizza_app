import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/l10n/en.dart';
import 'package:pizza_app/l10n/hu.dart';

class PizzaAppLocalizations {
  final Locale locale;

  PizzaAppLocalizations(this.locale);

  // Segédfüggvény, amivel a BuildContext-ből kikereshetjük a beregisztrált
  // PizzaAppLocalization példányt, amit a rendszer az épp aktuális nyelvvel
  // példányosít
  static PizzaAppLocalizations of(BuildContext context) {
    return Localizations.of<PizzaAppLocalizations>(
        context, PizzaAppLocalizations);
  }

  static const LocalizationsDelegate<PizzaAppLocalizations> delegate =
      _PizzaAppLocalizationsDelegate();

  // Hozzárendeljük a nyelv kódjához a definiált szövegeket
  static Map<String, Map<String, String>> _localizedValues = {
    'en': ENGLISH_TEXTS,
    'hu': HUNGARIAN_TEXTS,
  };

  // Az aktuális nyelv alapján adjuk vissza  az azonosítóhoz tartozó
  // lefordított szöveget.
  String stringById(String id) => _localizedValues[locale.languageCode][id];

  // Az egyes azonosítókhoz metódust rendelünk
  String get addAddressDialogTitle => stringById('addAddressDialogTitle');
  String get addresses => stringById('addresses');
  String get addressSaved => stringById('addressSaved');
  String get addToCart => stringById('addToCart');
  String get cancel => stringById('cancel');
  String get cheeseBurst => stringById('cheeseBurst');
  String get city => stringById('city');
  String get crust => stringById('crust');
  String get details => stringById('details');
  String get email => stringById('email');
  String get enterYourEmail => stringById('enterYourEmail');
  String get enterYourName => stringById('enterYourName');
  String get enterYourPhone => stringById('enterYourPhone');
  String get extraCheese => stringById('extraCheese');
  String get extraSpice => stringById('extraSpice');
  String get garlicRoasted => stringById('garlicRoasted');
  String get houseNumber => stringById('houseNumber');
  String get large => stringById('large');
  String get mandatoryField => stringById('mandatoryField');
  String get medium => stringById('medium');
  String get name => stringById('name');
  String get phone => stringById('phone');
  String get profile => stringById('profile');
  String get profileSaved => stringById('profileSaved');
  String get save => stringById('save');
  String get size => stringById('size');
  String get small => stringById('small');
  String get standard => stringById('standard');
  String get street => stringById('street');
  String get takeAPicture => stringById('takeAPicture');
  String get todaySpecials => stringById('todaySpecials');
  String get toppings => stringById('toppings');
  String get total => stringById('total');
  String get unknown => stringById('unknown');
}

// Segédosztály, ami az aktuális nyelv alapján hoz létre egy
// PizzaAppLocalizations példányt, amit majd a widget-ekben elérhetünk
// a BuildContext-en keresztül
class _PizzaAppLocalizationsDelegate
    extends LocalizationsDelegate<PizzaAppLocalizations> {
  const _PizzaAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hu'].contains(locale.languageCode);

  @override
  Future<PizzaAppLocalizations> load(Locale locale) {
    return SynchronousFuture<PizzaAppLocalizations>(
      PizzaAppLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_PizzaAppLocalizationsDelegate old) => false;
}
