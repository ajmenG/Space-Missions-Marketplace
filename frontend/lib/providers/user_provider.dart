// lib/providers/user_provider.dart
import 'package:flutter/foundation.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService userService;  

  User? _currentUser;
  User? get currentUser => _currentUser;

  UserProvider(this.userService) {
    _fetchUser();
  }

  void _fetchUser() {
    _currentUser = userService.getUser();
    notifyListeners();
  }

  void addCertification(String certId) {
    if (_currentUser == null) return;
    if (!_currentUser!.certifications.contains(certId)) {
      _currentUser = _currentUser!.copyWith(
        certifications: [..._currentUser!.certifications, certId],
      );
      notifyListeners();
    }
  }
}
