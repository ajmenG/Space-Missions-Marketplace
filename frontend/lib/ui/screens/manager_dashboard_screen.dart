// lib/ui/screens/manager_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/flight_provider.dart';
import 'package:frontend/providers/manager_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/ui/widgets/stats_card.dart';

class ManagerDashboardScreen extends StatelessWidget {
  const ManagerDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flights = context.watch<FlightProvider>().flights;
    final user = context.watch<UserProvider>().currentUser;
    final manager = context.watch<ManagerProvider>();

    if (user == null || flights.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    // In a real scenario, you'd have multiple users. For now, let's simulate with a single user list.
    final users = [user];

    return ListView(
      children: [
        SizedBox(height: 16),
        Text('Manager Analytics', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
        SizedBox(height: 20),
        ...flights.map((flight) {
          final stats = manager.getAnalytics(flight, users, flights);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Flight: ${flight.destination}', style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatsCard(label: 'Fully Certified', count: stats['fullyCertified']!),
                      StatsCard(label: 'One Short', count: stats['oneShort']!),
                      StatsCard(label: 'Two Short', count: stats['twoShort']!),
                      StatsCard(label: 'Three+ Short', count: stats['threeOrMoreShort']!),
                    ],
                  )
                ],
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}
