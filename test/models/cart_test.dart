import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_app/models/cart.dart';
import 'package:pizza_app/models/cart_item.dart';
import 'package:pizza_app/models/pizza.dart';

void main() {
  group('Cart', () {
    test('stores pizza', () {
      var model = Cart();
      model.add(CartItem(
          pizza: PIZZAS[0],
          size: 'small',
          topping: 'standard',
          crust: 'standard'));

      expect(model.items.length, 1);
    });

    test('counts the total value', () {
      var model = Cart();
      model.add(CartItem(
          pizza: PIZZAS[0],
          size: 'small',
          topping: 'standard',
          crust: 'standard'));
      model.add(CartItem(
          pizza: PIZZAS[1],
          size: 'small',
          topping: 'standard',
          crust: 'standard'));

      expect(model.total, 26.1);
    });
  });
}
