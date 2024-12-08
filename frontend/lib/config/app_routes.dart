// lib/config/app_routes.dart
import 'package:flutter/material.dart';
import 'package:frontend/ui/screens/home_screen.dart';

class AppRoutes {
  static const home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
