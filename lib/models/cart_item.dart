import 'package:pizza_app/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  final String size;
  final String crust;
  final String topping;

  CartItem({
    this.pizza,
    this.size,
    this.crust,
    this.topping,
  });
}
