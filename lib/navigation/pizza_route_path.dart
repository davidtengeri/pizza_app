class PizzaRoutePath {
  final int id;
  final bool isUnknown;

  PizzaRoutePath.home()
      : id = null,
        isUnknown = false;

  PizzaRoutePath.order(this.id) : isUnknown = false;

  PizzaRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isOrderPage => id != null;
}
