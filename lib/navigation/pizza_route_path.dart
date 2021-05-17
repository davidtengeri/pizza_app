// Az egyes útvonalak belső reprezentációja
class PizzaRoutePath {
  final int? id;
  final bool isUnknown;
  final bool isProfile;
  final bool isCart;

  PizzaRoutePath.home()
      : id = null,
        isUnknown = false,
        isProfile = false,
        isCart = false;

  PizzaRoutePath.order(this.id)
      : isUnknown = false,
        isProfile = false,
        isCart = false;

  PizzaRoutePath.unknown()
      : id = null,
        isUnknown = true,
        isProfile = false,
        isCart = false;

  PizzaRoutePath.profile()
      : id = null,
        isUnknown = false,
        isProfile = true,
        isCart = false;

  PizzaRoutePath.cart()
      : id = null,
        isUnknown = false,
        isProfile = false,
        isCart = true;

  bool get isHomePage => id == null && !isProfile;

  bool get isOrderPage => id != null && !isProfile;
}
