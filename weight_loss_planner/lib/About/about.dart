import 'package:flutter/material.dart';
import 'package:weight_loss_planner/sidebar.dart';

// The About Class Page
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('About'),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
    );
  }
}