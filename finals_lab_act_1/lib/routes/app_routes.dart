import 'package:flutter/material.dart';

import '../models/facility.dart';
import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/facilities_screen.dart';
import '../screens/facility_details_screen.dart';
import '../screens/home_screen.dart';
import '../screens/services_screen.dart';
import '../screens/unknown_route_screen.dart';

/// Central place where every route name and route builder is registered.
class AppRoutes {
  AppRoutes._();

  // Route names
  static const String home = '/';
  static const String about = '/about';
  static const String facilities = '/facilities';
  static const String facilityDetails = '/facility-details';
  static const String services = '/services';
  static const String contact = '/contact';

  /// Resolves a [RouteSettings] into a page.
  /// Used by MaterialApp.onGenerateRoute.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _page(const HomeScreen(), settings);
      case about:
        return _page(const AboutScreen(), settings);
      case facilities:
        return _page(const FacilitiesScreen(), settings);
      case services:
        return _page(const ServicesScreen(), settings);
      case contact:
        return _page(const ContactScreen(), settings);
      case facilityDetails:
        // Route arguments: name, image and description of the facility.
        final args = settings.arguments;
        if (args is FacilityArguments) {
          return _page(FacilityDetailsScreen(args: args), settings);
        }
        // Missing/invalid arguments -> show fallback instead of crashing.
        return _page(
          UnknownRouteScreen(routeName: settings.name),
          settings,
        );
      default:
        return _page(UnknownRouteScreen(routeName: settings.name), settings);
    }
  }

  /// Fallback used by MaterialApp.onUnknownRoute.
  static Route<dynamic> unknownRoute(RouteSettings settings) {
    return _page(UnknownRouteScreen(routeName: settings.name), settings);
  }

  static MaterialPageRoute<dynamic> _page(Widget child, RouteSettings s) {
    return MaterialPageRoute<dynamic>(builder: (_) => child, settings: s);
  }
}
