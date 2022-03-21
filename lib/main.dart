import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/screens/home_page.dart';
import 'package:pizza_app/screens/pizza_details.dart';

main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
      GoRoute(
        path: '/order/:id',
        builder: (BuildContext context, GoRouterState state) {
          final pizza = PIZZAS[int.parse(state.params['id']!)];
          return PizzaDetails(
            pizza: pizza,
          );
        },
      )
    ],
  );
}
