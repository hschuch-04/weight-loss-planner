import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationDrawer(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue[900]),
            child: Text(
              'Navigation',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Planner', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              if (ModalRoute.of(context)?.settings.name != '/') {
                Navigator.popUntil(context, ModalRoute.withName('/'))
              }
            }
          ),
          ListTile(
            title: Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => Navigator.pushNamed(context, '/calculator'),
          )
      ]),
    );
  }
}