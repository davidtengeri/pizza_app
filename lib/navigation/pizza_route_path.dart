// Az egyes útvonalak belső reprezentációja
class PizzaRoutePath {
  final int id;
  final bool isUnknown;
  final bool isProfile;

  PizzaRoutePath.home()
      : id = null,
        isUnknown = false,
        isProfile = false;

  PizzaRoutePath.order(this.id)
      : isUnknown = false,
        isProfile = false;

  PizzaRoutePath.unknown()
      : id = null,
        isUnknown = true,
        isProfile = false;

  PizzaRoutePath.profile()
      : id = null,
        isUnknown = false,
        isProfile = true;

  bool get isHomePage => id == null && !isProfile;

  bool get isOrderPage => id != null && !isProfile;
}
