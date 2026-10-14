import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CampusExplorerApp());
}

/// Root widget of the Campus Explorer application.
///
/// All routing is centralized in [AppRoutes] (see lib/routes/app_routes.dart)
/// and all styling is centralized in [AppTheme] (see lib/theme/app_theme.dart).
class CampusExplorerApp extends StatelessWidget {
  const CampusExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Explorer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
      // Fallback for any route that cannot be resolved.
      onUnknownRoute: AppRoutes.unknownRoute,
    );
  }
}
