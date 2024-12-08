// lib/ui/widgets/flight_card.dart
import 'package:flutter/material.dart';
import 'package:frontend/models/flight.dart';
import 'package:frontend/ui/screens/flight_details_screen.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;

  const FlightCard({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(flight.destination),
        subtitle: Text('${flight.durationDays} days - \$${flight.cost.toStringAsFixed(2)}'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (ctx) => FlightDetailsScreen(flight: flight),
          ));
        },
      ),
    );
  }
}
