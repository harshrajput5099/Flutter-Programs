import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  static Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'notes.db'),

      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, description TEXT)",
        );
      },

      version: 1,
    );
  }

  static Future<void> insert(
      String title,
      String description,
      ) async {

    final database = await db();

    await database.insert(
      "notes",
      {
        "title": title,
        "description": description,
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getAll() async {

    final database = await db();

    return database.query("notes");
  }

  static Future<void> delete(int id) async {

    final database = await db();

    await database.delete(
      "notes",
      where: "id=?",
      whereArgs: [id],
    );
  }
}