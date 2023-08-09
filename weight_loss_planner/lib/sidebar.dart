import 'package:flutter/material.dart';

// The Sidebar which allows navigation for the user
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
              if (ModalRoute.of(context)?.settings.name != '/planner') {
                Navigator.of(context).pushNamedAndRemoveUntil('/planner', (Route<dynamic> route) => false)
              }
            }
          ),
          Divider(),
          ListTile(
            title: Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              if (ModalRoute.of(context)?.settings.name != '/calculator') {
                Navigator.of(context).pushNamedAndRemoveUntil('/calculator', (Route<dynamic> route) => false)
              }
            }
          ),
          Divider(),
          ListTile(
            title: Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => {
              if (ModalRoute.of(context)?.settings.name != '/about') {
                Navigator.of(context).pushNamedAndRemoveUntil('/about', (Route<dynamic> route) => false)
              }
            },
          ),
          Divider()
      ]),
    );
  }
}