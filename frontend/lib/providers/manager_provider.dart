// lib/providers/manager_provider.dart
import 'package:flutter/foundation.dart';
import 'package:frontend/models/flight.dart';
import 'package:frontend/models/user.dart';

class ManagerProvider with ChangeNotifier {
  // In a real scenario, this would fetch from a database or API
  // For mock purposes, we will pass flights and user inside the methods.
  
  Map<String, int> getAnalytics(Flight flight, List<User> users, List<Flight> allFlights) {
    // For simplicity, we assume there's only one user. In a real scenario, you'd have a list of users.
    // Let's say we only have one user for the mock:
    // We will categorize them based on how many certs they're missing:

    int fullyCertified = 0;
    int oneShort = 0;
    int twoShort = 0;
    int threeOrMoreShort = 0;

    for (var user in users) {
      final missingCount = flight.requiredCertifications
          .where((rc) => !user.certifications.contains(rc))
          .length;

      if (missingCount == 0) fullyCertified++;
      else if (missingCount == 1) oneShort++;
      else if (missingCount == 2) twoShort++;
      else threeOrMoreShort++;
    }

    return {
      'fullyCertified': fullyCertified,
      'oneShort': oneShort,
      'twoShort': twoShort,
      'threeOrMoreShort': threeOrMoreShort,
    };
  }
}
