import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:weight_loss_planner/Planner/SQL/meal.dart';

/// Creates or opens the database to be used to alter or view
Future<Database> openConnection() async {
  return openDatabase(
    join(await getDatabasesPath(), 'planner.db'),
    onCreate: (db, version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS meals(
            id INT PRIMARY KEY,
            name STRING NOT NULL,
            calories INT NOT NULL,
            days STRING NOT NULL
        )''');
    },
    onConfigure: (db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    },
    version: 1,
  );
}

/// Retrieve meals for the day
Future<List<Meal>> meal(Database db, String day) async {
  final List<Map<String, dynamic>> maps =
      await db.query('meals', where: 'days = ?', whereArgs: [day]);

  return List.generate(maps.length, (i) {
    return Meal(
      id: maps[i]['id'] as int,
      name: maps[i]['name'] as String,
      calories: maps[i]['calories'] as int,
      days: maps[i]['days'] as String,
    );
  });
}

/// Delete a meal
Future<void> deleteMeal(Database db, int id) async {
  await db.delete('meals', where: 'id = ?', whereArgs: [id]);
}

/// Inserts a new meal into the database
Future<void> insertMeal(Database db, Meal meal) async {
  await db.insert('meals', meal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}
