import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pizza_app/models/pizza.dart';

class Favourites with ChangeNotifier {
  // Kedvenc pizzákat tárolja
  Set<Pizza> _items = HashSet();

  UnmodifiableListView<Pizza> get items => UnmodifiableListView(_items);

  // Új pizza hozzáadása a kedvenzekhez
  // Provider értesítése a notifyListeners() segítségével
  void add(Pizza pizza) {
    _items.add(pizza);
    notifyListeners();
  }

  // Pizza eltávolítása a kedvencek közül
  void remove(Pizza pizza) {
    _items.remove(pizza);
    notifyListeners();
  }

  bool isFavourite(Pizza pizza) => _items.contains(pizza);
}
