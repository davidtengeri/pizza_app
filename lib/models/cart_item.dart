import 'package:contacts_service/contacts_service.dart';
import 'package:pizza_app/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  final String size;
  final String crust;
  final String topping;
  Contact whoWillEat;

  CartItem({
    required this.pizza,
    required this.size,
    required this.crust,
    required this.topping,
    required this.whoWillEat,
  });
}
