// lib/providers/flight_provider.dart
import 'package:flutter/foundation.dart';
import 'package:frontend/models/flight.dart';
import 'package:frontend/services/flight_service.dart';

class FlightProvider with ChangeNotifier {
  final FlightService flightService;

  List<Flight> _flights = [];
  List<Flight> get flights => _flights;

  FlightProvider(this.flightService) {
    _fetchFlights();
  }

  void _fetchFlights() {
    _flights = flightService.getFlights();
    notifyListeners();
  }
}
