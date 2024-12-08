// lib/services/certification_service.dart
import 'package:frontend/models/certification.dart';

class CertificationService {
  // Mocked certification data
  List<Certification> getCertifications() {
    return [
      Certification(id: 'c1', name: 'Basic Space Flight Training'),
      Certification(id: 'c2', name: 'Advanced EVA Training'),
      Certification(id: 'c3', name: 'Long-Duration Life Support Training'),
    ];
  }
}
