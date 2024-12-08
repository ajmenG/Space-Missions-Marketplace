// lib/ui/screens/user_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/user_provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().currentUser;

    if (user == null) return Center(child: CircularProgressIndicator());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Name: ${user.name}', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 20),
          Text('Your Certifications:', style: Theme.of(context).textTheme.titleMedium),
          ...user.certifications.map((c) => Text(c)).toList(),
        ],
      ),
    );
  }
}
