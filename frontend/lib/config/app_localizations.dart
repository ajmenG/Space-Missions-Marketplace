// lib/config/app_localizations.dart
// In a real project, you would integrate the flutter_localizations package,
// intl, and load translations from .arb or JSON files.
class AppLocalizations {
  // Mock method
  static String getFlightDestinationLabel(String locale) {
    if (locale == 'pl') return 'Cel podróży';
    return 'Destination';
  }
}
