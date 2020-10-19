import 'package:flutter/material.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/navigation/pizza_route_path.dart';
import 'package:pizza_app/screens/home_page.dart';
import 'package:pizza_app/screens/pizza_details.dart';
import 'package:pizza_app/screens/unknown.dart';

class PizzaRouterDelegate extends RouterDelegate<PizzaRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PizzaRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey;

  Pizza _selectedPizza;
  bool show404 = false;

  PizzaRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  PizzaRoutePath get currentConfiguration {
    if (show404) {
      return PizzaRoutePath.unknown();
    }
    return _selectedPizza == null
        ? PizzaRoutePath.home()
        : PizzaRoutePath.order(PIZZAS.indexOf(_selectedPizza));
  }

  // Ebben a metódusban rakjuk össze, hogyan épül fel a stack.
  // A pages tömb írja le, hogy mi szerepel a history-ban. Ha a tartalma
  // változik, akkor a rendszer összehasonlítja az előző állapottal és képernyőt
  // vált a megfelelő animáció kíséretében
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(
            onPizzaSelect: _handleAddToCart,
          ),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: Unknown())
        else if (_selectedPizza != null)
          MaterialPage(
            key: ObjectKey(_selectedPizza),
            child: PizzaDetails(
              pizza: _selectedPizza,
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedPizza = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(PizzaRoutePath path) async {
    if (path.isUnknown) {
      _selectedPizza = null;
      show404 = true;
      return;
    }

    if (path.isOrderPage) {
      if (path.id < 0 || path.id > PIZZAS.length - 1) {
        show404 = true;
        return;
      }

      _selectedPizza = PIZZAS[path.id];
    } else {
      _selectedPizza = null;
    }

    show404 = false;
  }

  void _handleAddToCart(Pizza pizza) {
    _selectedPizza = pizza;
    notifyListeners();
  }
}
