import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/models/cart.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  final Color iconColor;
  final void Function() onPressed;

  const CartButton({
    Key? key,
    this.iconColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nrOfItemsInCart =
        context.select<Cart, int>((cart) => cart.items.length);

    return ButtonTheme(
      padding: EdgeInsets.all(0),
      minWidth: 30,
      child: FlatButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                size: 30,
                color: iconColor,
              ),
            ),
            Positioned.fill(
              right: 0,
              top: 0,
              left: 25,
              bottom: 25,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[900],
                ),
                child: DottedBorder(
                  padding: EdgeInsets.zero,
                  color: iconColor,
                  strokeWidth: 1,
                  dashPattern: [1.5, 2],
                  borderType: BorderType.Circle,
                  child: Center(
                    child: Text(
                      nrOfItemsInCart.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
