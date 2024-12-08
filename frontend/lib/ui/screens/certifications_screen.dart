// lib/ui/screens/certifications_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/user_provider.dart';

class CertificationsScreen extends StatelessWidget {
  final List<String> missingCerts;

  const CertificationsScreen({Key? key, required this.missingCerts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Certifications')),
      body: ListView(
        children: missingCerts.map((cert) {
          return ListTile(
            title: Text(cert),
            trailing: ElevatedButton(
              onPressed: () {
                // Mock enrollment
                userProvider.addCertification(cert);
              },
              child: Text('Enroll'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
