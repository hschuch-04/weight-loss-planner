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
            title: RichText(text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: const [
                WidgetSpan(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.calculate),
                )),
                TextSpan(text: 'Calculator')
              ]
              )),
            onTap: () => {
              if (ModalRoute.of(context)?.settings.name != '/calculator') {
                Navigator.of(context).pushNamedAndRemoveUntil('/calculator', (Route<dynamic> route) => false)
              }
            }
          ),
          Divider(),
          ListTile(
            title: RichText(text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: const [
                WidgetSpan(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.calendar_view_week),
                )),
                TextSpan(text: 'Planner')
              ]
              )),
            onTap: () => {
              if (ModalRoute.of(context)?.settings.name != '/planner') {
                Navigator.of(context).pushNamedAndRemoveUntil('/planner', (Route<dynamic> route) => false)
              }
            }
          ),
          Divider(),
          ListTile(
            title: RichText(text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: const [
                WidgetSpan(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.auto_graph),
                )),
                TextSpan(text: 'Tracker')
              ]
              )),
            onTap: () => {
              if (ModalRoute.of(context)?.settings.name != '/tracker') {
                Navigator.of(context).pushNamedAndRemoveUntil('/tracker', (Route<dynamic> route) => false)
              }
            }
          ),     
          Divider(),
          ListTile(
            title: RichText(text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: const [
                WidgetSpan(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.pageview),
                )),
                TextSpan(text: 'About')
              ]
              )),
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