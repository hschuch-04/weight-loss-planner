import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weight_loss_planner/PLANNER/Components/dropdown.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';

/// This page has all the information about meals and their contents
class Planner extends StatefulWidget {
  final Database db;

  const Planner({Key? key, required this.db}) : super(key: key);

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Weekly Planner'),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DropDownWeek(),
          )
        ],
      )
    );
  }
}
