import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/cart.dart';
import 'package:pizza_app/models/cart_item.dart';
import 'package:provider/provider.dart';

import 'contact_chooser.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  void chooseAContact(BuildContext context) async {
    var cart = context.read<Cart>();
    if (await Permission.contacts.request().isGranted) {
      Contact contact = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ContactChooser()),
      );

      cart.setEater(item, contact);
    } else if (await Permission.contacts.isPermanentlyDenied) {
      openAppSettings();
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content:
                Text(PizzaAppLocalizations.of(context)!.canNotAccessToContacts),
          ),
        );
    }
  }

  void removeSelectedContact(BuildContext context) {
    context.read<Cart>().setEater(item, null);
  }

  const CartItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: -5,
              offset: Offset(-5, -5),
              blurRadius: 30,
            ),
            BoxShadow(
              color: Colors.grey.shade900.withOpacity(0.3),
              spreadRadius: 2,
              offset: Offset(7, 7),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.pizza.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                ButtonTheme(
                  padding: EdgeInsets.zero,
                  minWidth: 20,
                  child: FlatButton(
                    onPressed: () {
                      var cart = context.read<Cart>();
                      cart.remove(item);
                    },
                    child: Icon(
                      Icons.delete_outline,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${PizzaAppLocalizations.of(context)!.size}: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (item.size != null)
                            Text(
                              PizzaAppLocalizations.of(context)!
                                  .stringById(item.size),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${PizzaAppLocalizations.of(context)!.crust}: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (item.crust != null)
                            Text(
                              PizzaAppLocalizations.of(context)!
                                  .stringById(item.crust),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${PizzaAppLocalizations.of(context)!.toppings}: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (item.topping != null)
                            Text(
                              PizzaAppLocalizations.of(context)!
                                  .stringById(item.topping),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${item.pizza.price.toStringAsPrecision(4)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () {
                    chooseAContact(context);
                  },
                  icon: Icon(Icons.contacts),
                  label: Text(item.whoWillEat?.displayName ??
                      PizzaAppLocalizations.of(context)!.whoWillEat),
                ),
                if (item.whoWillEat != null)
                  IconButton(
                    onPressed: () {
                      removeSelectedContact(context);
                    },
                    icon: Icon(Icons.remove_circle),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
