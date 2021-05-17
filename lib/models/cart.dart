import 'dart:collection';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/models/cart_item.dart';

class Cart with ChangeNotifier {
  // A kosár tartalma
  List<CartItem> _items = [];

  // Egy olyan listát ad eredményül, ami kívülről nem módosítható.
  // Emiatt a list csak az add() metóduson keresztül lesz bővíthető.
  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  // Új pizza hozzáadása a kosárhoz
  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double get total =>
      _items.fold(0, (amount, item) => item.pizza.price + amount);

  void setEater(CartItem item, Contact? eater) {
    item.whoWillEat = eater;
    notifyListeners();
  }
}
