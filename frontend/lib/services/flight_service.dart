// lib/services/flight_service.dart
import 'package:frontend/models/flight.dart';

class FlightService {
  // Mocked flight data
  List<Flight> getFlights() {
    return [
      Flight(
        id: 'f1',
        destination: 'Low Earth Orbit',
        durationDays: 10,
        cost: 500000,
        requiredCertifications: ['c1'],
      ),
      Flight(
        id: 'f2',
        destination: 'Moon Orbit',
        durationDays: 20,
        cost: 1500000,
        requiredCertifications: ['c1', 'c2'],
      ),
      Flight(
        id: 'f3',
        destination: 'Mars Colony',
        durationDays: 90,
        cost: 5000000,
        requiredCertifications: ['c1', 'c2', 'c3'],
      ),
    ];
  }
}
