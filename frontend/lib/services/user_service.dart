// lib/services/user_service.dart
import 'package:frontend/models/user.dart';

class UserService {
  // Mocked single user data
  User getUser() {
    return User(
      id: 'u1',
      name: 'John Doe',
      certifications: ['c1'], // User currently has basic certification
    );
  }
}
