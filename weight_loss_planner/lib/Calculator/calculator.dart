import 'package:flutter/material.dart';
import 'package:weight_loss_planner/sidebar.dart';

// The Calculator Class Page
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Calorie Calculator'),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,

    );
  }
}