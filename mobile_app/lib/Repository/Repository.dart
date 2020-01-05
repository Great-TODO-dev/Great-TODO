import 'dart:convert';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../Stores/Task.dart';

class Repository {
  static const DBNAME = "GREAT-TODO.db";
  static const TASKSTABLENAME = "tasks";
  static const DBTABLEPARAMS =
      '$TASKSTABLENAME(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, date TEXT, deadline TEXT, tags TEXT, store TEXT)';

  static Future<sql.Database> getInstance() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dbPath, DBNAME), onOpen: (db) {
      db.execute('CREATE TABLE IF NOT EXISTS $DBTABLEPARAMS');
    }, onCreate: (db, version) {
      return db.execute('CREATE TABLE $DBTABLEPARAMS');
    }, version: 1);
    return db;
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await Repository.getInstance();
    return await db.query(TASKSTABLENAME);
  }

  static Future<void> insertTask(Task task) async {
    final db = await Repository.getInstance();
    String tagsString = jsonEncode(task.tags);
    db.insert(TASKSTABLENAME, {
      'name': task.name,
      'description': task.description,
      'tags': tagsString,
      'date': task.date == null ? 'null' : task.date.toIso8601String(),
      'deadline':
          task.deadline == null ? 'null' : task.deadline.toIso8601String(),
      'store': task.storeToString()
    });
  }

  static Future<void> updateTask(Task task) async {
    final db = await Repository.getInstance();
    String tagsString = jsonEncode(task.tags);
    db.update(TASKSTABLENAME, {
      'name': task.name,
      'description': task.description,
      'tags': tagsString,
      'date': task.date == null ? 'null' : task.date.toIso8601String(),
      'deadline':
          task.deadline == null ? 'null' : task.deadline.toIso8601String(),
      'store': task.storeToString()
    }, where: "id = ${task.id}");
  }
}
