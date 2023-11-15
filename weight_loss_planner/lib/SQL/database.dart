import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:weight_loss_planner/SQL/meal.dart';
import 'package:weight_loss_planner/SQL/weight.dart';

/// Creates or opens the database to be used to alter or view
Future<Database> openConnection() async {
  return openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS meals(
            id INT PRIMARY KEY,
            name STRING NOT NULL,
            calories INT NOT NULL,
            days STRING NOT NULL
        )''');
      await db.execute('''CREATE TABLE IF NOT EXISTS weight(
            id INT PRIMARY KEY,
            weight DOUBLE NOT NULL,
            date DATETIME NOT NULL
        )''');
    },
    onConfigure: (db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    },
    version: 1,
  );
}

/// ---------------- MEALS --------------- ///

/// Retrieve meals for the day
Future<List<Meal>> getMeal(Database db, String day) async {
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

/// ---------------- WEIGHT --------------- ///

/// Gets all the weight data measured by the user
Future<List<Weight>> weight(Database db) async {
  final List<Map<String, dynamic>> maps = await db.query('weight');

  return List.generate(maps.length, (i) {
    return Weight(
      id: maps[i]['id'] as int,
      weight: maps[i]['weight'] as double,
      date: maps[i]['date'] as DateTime,
    );
  });
}

// Inserts a new weight into the database
Future<void> insertWeight(Database db, Weight weight) async {
  await db.insert('weight', weight.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}
