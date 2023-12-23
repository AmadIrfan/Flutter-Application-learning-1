import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DbHalper {
  static Future<Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'Place.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE PLACE (id TEXT PRIMARY KEY,title TEXT,image TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insertData(
      String table, Map<String, dynamic> data) async {
    final db = await DbHalper.dataBase();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getAndSetData(String table) async {
    final db = await DbHalper.dataBase();
    return db.query(table);
  }
}
