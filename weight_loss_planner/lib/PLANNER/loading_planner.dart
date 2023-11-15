import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weight_loss_planner/SQL/database.dart';
import 'package:weight_loss_planner/PLANNER/planner.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';

/// The Loading Planner Widget when trying to grab informaton
/// This information is stored in a standard document folder
class LoadingPlanner extends StatefulWidget {
  const LoadingPlanner({super.key});

  @override
  State<LoadingPlanner> createState() => _LoadingPlannerState();
}

class _LoadingPlannerState extends State<LoadingPlanner> {
  
  /// Creates the database if not initally setup 
  /// and then navigates to the planner
  void loadDatabase() async {
    final db = await openConnection();
    if (mounted) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, animation2) => Planner(db: db),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    }
  }

  @override
  void initState() {
    super.initState();
    loadDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Planner'),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: SpinKitCircle(color: Colors.black, size: 80),
      ),
    );
  }
}
