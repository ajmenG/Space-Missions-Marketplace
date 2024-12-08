// lib/ui/screens/flight_details_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/models/flight.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/ui/screens/certifications_screen.dart';

class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;

  const FlightDetailsScreen({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().currentUser!;
    final missingCerts = flight.requiredCertifications
        .where((c) => !user.certifications.contains(c))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(flight.destination)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Duration: ${flight.durationDays} days'),
            Text('Cost: \$${flight.cost.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            if (missingCerts.isEmpty)
              ElevatedButton(
                onPressed: () {
                  // Implement booking flow
                },
                child: Text('Book Flight'),
              )
            else ...[
              Text('You are missing the following certifications:'),
              ...missingCerts.map((m) => Text(m)).toList(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx) => CertificationsScreen(missingCerts: missingCerts),
                  ));
                },
                child: Text('Acquire Missing Certifications'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
