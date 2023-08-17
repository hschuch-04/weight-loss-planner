import 'dart:async';
import 'package:sqflite/sqflite.dart';

class Planner {
  final String path;
  late Future<Database> db;

  Planner({required this.path});

  /// Creates the database to be used
  void createDatabase() async {
    db = openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE days(id INT PRIMARY KEY, day STRING NOT NULL)'
      );
    });
  }
}
