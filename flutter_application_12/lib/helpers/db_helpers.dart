import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static Future<Database> dataBases() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbPath, 'Place.db'),
        onCreate: (db, versoin) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMERY KAY,title TEXT,image TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.dataBases();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getandSetData(String table) async {
    final db = await DbHelper.dataBases();
    return db.query(table);
  }
}
