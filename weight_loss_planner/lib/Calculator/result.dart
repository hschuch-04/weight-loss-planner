import 'package:flutter/material.dart';

/// The result page from calculating user BMR and calorie deficit
/// Needs a weight, height, age, gender and activity parsed
class Result extends StatelessWidget {
  final int weight;
  final int height;
  final int age;
  final String gender;
  final String activity;

  const Result({
    Key? key,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.activity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Calorie Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('$weight'),
          Text('$height'),
          Text('$age'),
          Text(gender),
          Text(activity)
        ]
      ),
    );
  }
}
