import 'package:flutter/material.dart';
import 'package:pizza_app/screens/home_page.dart';
import 'package:pizza_app/screens/pizza_details.dart';

main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => PizzaDetails(),
      },
    );
  }
}
