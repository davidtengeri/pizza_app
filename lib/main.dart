import 'package:flutter/material.dart';
import 'package:pizza_app/navigation/pizza_route_information_parser.dart';
import 'package:pizza_app/navigation/pizza_router_delegate.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/models/cart.dart';

main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Cart(),
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PizzaRouterDelegate _routerDelegate;
  PizzaRouteInformationParser _routeInformationParser;

  @override
  void initState() {
    super.initState();
    _routeInformationParser = PizzaRouteInformationParser();
    _routerDelegate = PizzaRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}
