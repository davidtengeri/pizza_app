import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pizza_app/db/profile_repository.dart';
import 'package:pizza_app/db/sql.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/favourites.dart';
import 'package:pizza_app/navigation/pizza_route_information_parser.dart';
import 'package:pizza_app/navigation/pizza_router_delegate.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/models/cart.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Elérhető kamerák listája
  final cameras = await availableCameras();

  // Kivesszük a legelső kamerát a listából
  final camera = cameras.length > 0 ? cameras.first : null;

  final sql = Sql();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Favourites(),
        ),
        Provider(
          create: (_) => ProfileRepository(sql: sql),
        ),
        // A kamera a Provider-en keresztül lesz elérhető.
        Provider.value(value: camera),
      ],
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late PizzaRouterDelegate _routerDelegate;
  late PizzaRouteInformationParser _routeInformationParser;

  @override
  void initState() {
    super.initState();
    _routeInformationParser = PizzaRouteInformationParser();
    _routerDelegate = PizzaRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
      // A nyelvi osztályokat regisztráló delegate objektumok listája
      // Ezeken keresztül tölti be a rendszer szükség esetén az éppen aktuális
      // nyelv alapján a megfelelő localization osztályokat, amiken keresztül
      // elérhetjük a lefordított szövegeket.
      localizationsDelegates: [
        PizzaAppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // Az alkalmazásunk által támogatott nyelvek listája
      supportedLocales: [
        const Locale('en', ''),
        const Locale('hu', ''),
      ],
    );
  }
}
