import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../Stores/Task.dart';

class Repository {
  static const DBNAME = "GREAT-TODO.db";
  static const TASKSTABLENAME = "tasks";

  static Future<sql.Database> getInstance() async{
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dbPath, DBNAME), onCreate: (db, version) {
      return db.execute('CREATE TABLE $TASKSTABLENAME(id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT, description TEXT)');
    }, version: 1);
    return db;
  }

  static Future<List<Map<String, dynamic>>> getDataFromDb() async {
    final db = await Repository.getInstance();
    return await db.query(TASKSTABLENAME);
  }

  static Future<void> insertDataInDb(Task task) async {
    final db = await Repository.getInstance();
    db.insert(TASKSTABLENAME, {
      'name' : task.name,
      'description' : task.description
    });
  }
}
