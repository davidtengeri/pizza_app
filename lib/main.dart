import 'package:flutter/material.dart';
import 'package:pizza_app/navigation/pizza_route_information_parser.dart';
import 'package:pizza_app/navigation/pizza_router_delegate.dart';

main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: PizzaRouteInformationParser(),
      routerDelegate: PizzaRouterDelegate(),
    );
  }
}
