import 'package:flutter/material.dart';
import 'package:weight_loss_planner/Widgets/sidebar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Weight Loss Planner'),
          centerTitle: true,
        ),
        drawer: Sidebar(),
        drawerEnableOpenDragGesture: false,
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
