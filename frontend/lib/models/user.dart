// lib/models/user.dart
class User {
  final String id;
  final String name;
  final List<String> certifications;

  User({
    required this.id,
    required this.name,
    required this.certifications,
  });

  User copyWith({String? name, List<String>? certifications}) {
    return User(
      id: this.id,
      name: name ?? this.name,
      certifications: certifications ?? this.certifications,
    );
  }
}
