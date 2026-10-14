import 'package:flutter/material.dart';

import '../data/campus_data.dart';
import '../routes/app_routes.dart';

/// Reusable navigation drawer used by every main screen.
///
/// Uses Navigator.pushReplacementNamed so the drawer does not stack
/// duplicate pages on the back stack.
class AppDrawer extends StatelessWidget {
  /// The route currently shown (highlighted in the drawer).
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.colorScheme.primary),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.school, color: Colors.white, size: 40),
                SizedBox(height: 8),
                Text(
                  'Campus Explorer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  CampusData.schoolName,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          _item(context, Icons.home, 'Home', AppRoutes.home),
          _item(context, Icons.info, 'About the Campus', AppRoutes.about),
          _item(context, Icons.apartment, 'Campus Facilities',
              AppRoutes.facilities),
          _item(context, Icons.support_agent, 'Student Services',
              AppRoutes.services),
          _item(context, Icons.contact_phone, 'Contact Us', AppRoutes.contact),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String label, String route) {
    final selected = route == currentRoute;
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: selected,
      onTap: () {
        Navigator.pop(context); // close the drawer first
        if (!selected) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }
}
