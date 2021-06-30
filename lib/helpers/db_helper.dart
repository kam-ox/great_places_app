import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

//TODO ! Database doesn't work
class DBHelper {
  static Future<Database> database() async {
    //*creating or getting access to the databse
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper
        .database(); //*repeat DBHelper since these methods are global and therefore they scope globally
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    // *use async when there is await and therefore there is a Future
    final db = await DBHelper.database(); // * getting acess to the database
    return db.query(table); // * query for getting the data
  }
}
