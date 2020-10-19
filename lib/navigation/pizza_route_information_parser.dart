import 'package:flutter/material.dart';
import 'package:pizza_app/navigation/pizza_route_path.dart';

class PizzaRouteInformationParser
    extends RouteInformationParser<PizzaRoutePath> {
  @override
  Future<PizzaRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Kezdő oldal
    if (uri.pathSegments.length == 0) {
      return PizzaRoutePath.home();
    }

    // '/order/:id' útvonalak kezelése.
    // Az :id a kiválasztott pizza indexe lesz a PIZZAS tömbben.
    // Ez később leheg egy adatbázis beli ID, ami alapján betöltjük a megfelelő
    // pizzát az adatbázisból
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'order') return PizzaRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return PizzaRoutePath.unknown();
      return PizzaRoutePath.order(id);
    }

    // Ismeretlen útvonal
    return PizzaRoutePath.unknown();
  }

  // Saját belső útvonal reprezentációnk alapján állítja elő az
  // útvonal információkat. Web-es platform esetén használatos.
  @override
  RouteInformation restoreRouteInformation(PizzaRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isOrderPage) {
      return RouteInformation(location: '/order/${path.id}');
    }
    return null;
  }
}
