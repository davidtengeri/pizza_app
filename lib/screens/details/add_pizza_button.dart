import 'package:flutter/material.dart';
import 'package:pizza_app/components/max_width_button.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';

class AddPizzaButton extends StatefulWidget {
  final void Function() onPressed;
  final int amount;

  const AddPizzaButton({
    Key key,
    this.onPressed,
    this.amount,
  }) : super(key: key);

  @override
  _AddPizzaButtonState createState() => _AddPizzaButtonState();
}

class _AddPizzaButtonState extends State<AddPizzaButton>
    with SingleTickerProviderStateMixin {
  // Animációt vezéreljük majd a controller-en keresztül
  AnimationController _controller;
  // Az animáció aktuális értékét tárolja. Jellemzően ez egy 0-1 közötti szám,
  // amit átalakíthatunk arra az értékre amire nekünk szükségünk van.
  // Ez a szám az animációnak megfelelő időtartam alatt a megfelelő ütemben
  // változik
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      // Az animáció hossza 0.5 másodpersz lesz
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    // Az animáció egy görbe mentén fogja az aktuális értékét megadni.
    // Ez a görbe azt mondja meg, hogy adott időpillanatban milyen érték
    // alapján dolgozunk
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  Future<void> _runAnimation(BuildContext context) async {
    // Megkeressük a gombot, amivel hozzá lehet adni a pizzát a kosrához
    final RenderBox renderBox = context.findRenderObject();
    // A bel fölső sarokhoz képest kiszámítjuk a pozícióját
    final widgetPosition = renderBox.localToGlobal(Offset.zero);
    // Lekérjük a szélességét
    final widgetWidth = renderBox.size.width;
    // Lekérjük a képernyő szélességét
    final screenWidth = MediaQuery.of(context).size.width;
    // Az OverlayEntry egy olyan widget ami a többi widget főlé helyezhető.
    // Mint például a doalógusablakok
    var entry = OverlayEntry(
      // Az animációt az AnimatedBuilder segítségével készítjük el.
      // Ha változik az animáció értéke, akkor újrarajzolja magát.
      builder: (context) => AnimatedBuilder(
        animation: _animation,
        // A hozzáadandó pizzák száma lesz a rajzolandó elem. Ennek a
        // poyícióját módosítjuk, ahogy az animáció változik az idő előrehaladtával
        builder: (context, child) => Positioned(
          left: (widgetPosition.dx + widgetWidth / 2) +
              (screenWidth - widgetPosition.dx - widgetWidth / 2 - 68) *
                  (_animation.value),
          top: 25 + (widgetPosition.dy - 60) * (1 - _animation.value),
          child: child,
        ),
        // A hozzáadandó pizzák száma
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red[900],
              shape: BoxShape.circle,
            ),
            child: Text(
              '+${widget.amount}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
    // Hozzáadjuk az elemet a többi widget fölé
    Overlay.of(context).insert(entry);
    // Elindítjuk az animációt és megvárjuk a végét
    await _controller.forward(from: 0);
    // Ha vége az animációnak, akkor töröljük az elemet
    entry.remove();
    // Legvégül pedig a kapott onPressed eseménykezelőt hívjuk meg
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return MaxWidthButton(
      text: PizzaAppLocalizations.of(context).addToCart,
      onPressed: () {
        _runAnimation(context);
      },
    );
  }
}
