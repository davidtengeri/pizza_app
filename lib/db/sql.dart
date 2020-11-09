import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

// Adatbázis kapcsolatok kezelése
class Sql {
  Database _database;

  // Ez a getter létrehozza a kapcsolatot az adatázissal és eltárolja azt
  // későbbi felhasználás céljából.
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await openDatabase(
      // Az adatbázis fájl alapú. Ennek a fájlnak a helyét állítjuk elő
      join(
        await getDatabasesPath(),
        'pizza_app.db',
      ),
      version: 1,
      // Adatbázis létrehozása. Akkor fog lefutni, amikor az alkalmazásunk először
      // elindul az eszközön. Ha már létezett az alkalmazás, akkor a verziószám
      // növelésével meghívható lesz az onUpdate, ami le tudja kezelni az
      // adatbázis szerkezetének változását.
      onCreate: (db, version) async {
        // Fontos, hogy ha többb táblára van szükség, akkor azokat külön
        // execute hívásban hozzuk létre.
        await db.execute('''
        CREATE TABLE profile(
          id INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT,
          phone TEXT
        );
        ''');
        await db.execute('''
        CREATE TABLE addresses(
          id INTEGER PRIMARY KEY,
          city TEXT,
          street TEXT,
          houseNumber TEXT,
          lat REAL,
          lng REAL
        );
        ''');
      },
    );
    return _database;
  }
}
