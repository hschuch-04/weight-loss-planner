import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';
import 'package:weight_loss_planner/SQL/database.dart';
import 'package:weight_loss_planner/TRACKER/tracker.dart';

/// The Loading Tracker Widget when trying to grab informaton
/// This information is stored in a standard document folder
class LoadingTracker extends StatefulWidget {
  const LoadingTracker({super.key});

  @override
  State<LoadingTracker> createState() => _LoadingTrackerState();
}

class _LoadingTrackerState extends State<LoadingTracker> {
  /// Loads the database connection and then navigates to the tracker
  void loadDatabase() async {
    final db = await openConnection();
    if (mounted) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, animation2) => Tracker(db: db),
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Tracker'),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: SpinKitCircle(color: Colors.white, size: 80),
      ),
    );
  }
}
