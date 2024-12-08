// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/app.dart';
import 'package:frontend/providers/flight_provider.dart';
import 'package:frontend/providers/manager_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/services/flight_service.dart';
import 'package:frontend/services/user_service.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FlightProvider(FlightService())),
      ChangeNotifierProvider(create: (_) => UserProvider(UserService())),
      ChangeNotifierProvider(create: (_) => ManagerProvider()),
    ],
    child: const MyApp(),
  ));
}
