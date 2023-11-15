import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';

/// The Tracker graph page which where you can view the weight over time
class Tracker extends StatelessWidget {
  final Database db;
  
  const Tracker({Key? key, required this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Weight Tracker'),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
