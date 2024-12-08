// lib/ui/screens/flights_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/flight_provider.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/ui/widgets/flight_card.dart';

class FlightsScreen extends StatelessWidget {
  const FlightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flights = context.watch<FlightProvider>().flights;
    final user = context.watch<UserProvider>().currentUser;

    if (user == null) {
      return Center(child: CircularProgressIndicator());
    }

    // Categorize flights
    final eligibleFlights = flights.where((flight) {
      return flight.requiredCertifications.every((c) => user.certifications.contains(c));
    }).toList();

    final upcomingFlights = flights.where((flight) {
      // If not fully qualified but close (missing some certs)
      return flight.requiredCertifications.any((c) => !user.certifications.contains(c));
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text('Eligible Flights', style: Theme.of(context).textTheme.titleLarge),
          ...eligibleFlights.map((f) => FlightCard(flight: f)).toList(),
          SizedBox(height: 20),
          Text('Upcoming Eligibility', style: Theme.of(context).textTheme.titleLarge),
          ...upcomingFlights.map((f) => FlightCard(flight: f)).toList(),
        ],
      ),
    );
  }
}
