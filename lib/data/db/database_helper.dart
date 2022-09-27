import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblRestaurant = "restaurants";

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db =
        openDatabase("$path/restaurantapp.db", onCreate: (db, version) async {
      await db.execute("""
          CREATE TABLE $_tblRestaurant (
          id TEXT PRIMARY KEY,
          name TEXT,
          description TEXT,
          pictureId TEXT,
          city TEXT,
          rating REAL
          )
        """);
    }, version: 1);

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();
    return _database;
  }

  Future<void> insertRestaurantFav(Restaurant restaurant) async {
    final db = await database;
    await db!.insert(_tblRestaurant, restaurant.toJson());
  }

  Future<List<Restaurant>> getRestaurantsFav() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblRestaurant);
    return results.map((res) => Restaurant.fromJson(res)).toList();
  }

  Future<Map> getRestaurantFavById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results =
        await db!.query(_tblRestaurant, where: "id = ?", whereArgs: [id]);

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeRestaurantFav(String id) async {
    final db = await database;

    await db!.delete(_tblRestaurant, where: "id = ?", whereArgs: [id]);
  }
}
