import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Planner {
  late Future<Database> db;

  Planner();

  /// Creates or opens the database to be used to alter or view
  void createDatabase() async {
    db = openDatabase(
      join(await getDatabasesPath(), 'planner.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE IF NOT EXISTS days(
                id INT PRIMARY KEY, 
                day STRING NOT NULL
            )''');
        await db.execute(
          '''CREATE TABLE IF NOT EXISTS meals(
              id INT PRIMARY KEY,
              name STRING NOT NULL,
              calories INT NOT NULL,
              dayId INT NOT NULL,
              FOREIGN KEY (dayId) REFERENCES days (id) ON DELETE CASCADE ON UPDATE CASCADE
          )''');
      },
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      version: 1,
    );
  }
}
