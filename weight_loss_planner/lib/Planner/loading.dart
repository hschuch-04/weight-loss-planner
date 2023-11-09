import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weight_loss_planner/Planner/SQL/database.dart';
import 'package:weight_loss_planner/Planner/planner.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';

/// The Loading Widget when trying to grab informaton
/// This information is stored in a standard document folder
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  /// Creates the database if not initally setup 
  /// and then navigates to the planner
  void getPlannerData() async {
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
    getPlannerData();
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
