// lib/models/flight.dart
class Flight {
  final String id;
  final String destination;
  final int durationDays;
  final double cost;
  final List<String> requiredCertifications;

  Flight({
    required this.id,
    required this.destination,
    required this.durationDays,
    required this.cost,
    required this.requiredCertifications,
  });
}
