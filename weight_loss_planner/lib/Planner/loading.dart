import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weight_loss_planner/Reusable/sidebar.dart';

/// The Loading Widget when trying to grab informaton
/// This information is stored in a standard document folder
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /// Gets the file reference to be used by the planner
  void getPlannerData() async {
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
