import 'package:flutter/material.dart';
import 'package:weight_loss_planner/Calculator/Result/table.dart';
import 'package:weight_loss_planner/Calculator/bmr.dart';

/// The result page from calculating user BMR and calorie deficit
/// Needs a weight, height, age, gender and activity parsed
class Result extends StatelessWidget {
  final BasalMetabolicRate bmr;
  final String gender;
  final String activity;

  const Result(
      {Key? key,
      required this.bmr,
      required this.gender,
      required this.activity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Calorie Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Exercise Level: $activity',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            gender == 'Male'
                ? CalorieTable(tabledata: bmr.malecalories())
                : CalorieTable(tabledata: bmr.femalecalories()),
          ],
        ),
      ),
    );
  }
}
