import 'package:flutter/material.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';

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
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                'Calorie Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              Text("")
            ]
          ),
        ),
      ),
    );
  }
}