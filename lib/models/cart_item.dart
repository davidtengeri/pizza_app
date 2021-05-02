import 'package:pizza_app/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  final String size;
  final String crust;
  final String topping;

  CartItem({
    required this.pizza,
    required this.size,
    required this.crust,
    required this.topping,
  });
}
