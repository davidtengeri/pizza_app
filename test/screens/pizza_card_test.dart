import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/favourites.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/screens/home/pizza_card.dart';
import 'package:provider/provider.dart';

void main() {
  group('PizzaCard', () {
    testWidgets('shows pizza name', (WidgetTester tester) async {
      // Megjelenítjük a felületet. A PizzaCard widget használja a localizációt
      // és a Favourites modelt, ezeket biztosítnunk kell a számára.
      await tester.pumpWidget(
        Localizations(
          locale: Locale('en', 'EN'),
          delegates: [
            PizzaAppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => Favourites(),
              ),
            ],
            child: PizzaCard(
              pizza: PIZZAS[0],
            ),
          ),
        ),
      );
      // Megvárjuk, amig nem változik a képernyőn megjelenő felület, például
      // minden animáció véget ért.
      await tester.pumpAndSettle();

      // Szöveg kereséséhez létrehozunk egy finder-t.
      final pizzaNameFinder = find.text(PIZZAS[0].name);
      // Ellenőrizzük, hogy van-e ilyen szöveg, azaz látható-e a pizza neve.
      expect(pizzaNameFinder, findsOneWidget);
    });
  });
}
