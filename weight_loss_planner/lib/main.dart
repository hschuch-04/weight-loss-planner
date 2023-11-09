import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_loss_planner/About/about.dart';
import 'package:weight_loss_planner/Calculator/calculator.dart';
import 'package:weight_loss_planner/Planner/loading.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';

/// The Main Function which initiates the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  // Creates the routes, and starts at '/'
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MainApp(), 
      '/loading': (context) => Loading(),
      '/calculator': (context) => Calculator(),
      '/about': (context) => About()
    },
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

/// The Main App Class Component
class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Weight Loss Planner'),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: Text('Welcome to the Weight Loss Planner! Click the sidebar to navigate around the application.'),
      ),
    );
  }
}
