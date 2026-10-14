import 'package:flutter/material.dart';

import '../models/facility.dart';
import '../models/student_service.dart';

/// Sample data used by the app.
/// NOTE: Edit the text below so it matches your school's real information.
class CampusData {
  CampusData._();

  static const String schoolName = 'University of Cabuyao';
  static const String schoolLocalName = 'Pamantasan ng Cabuyao';
  static const String address =
      'Katapatan Mutual Homes, Brgy. Banay-banay, City of Cabuyao, Laguna 4025';

  static const String bannerImage = 'assets/images/campus_banner.png';

  static const List<Facility> facilities = [
    Facility(
      name: 'Library',
      image: 'assets/images/library.png',
      description:
          'A quiet study space with books, journals, and reference materials '
          'for every program. Students can borrow books, use the reading '
          'area, and work on group research.',
    ),
    Facility(
      name: 'Computer Laboratory',
      image: 'assets/images/computer_lab.png',
      description:
          'Equipped with desktop computers and internet access for '
          'programming, multimedia, and other IT classes. Open to students '
          'during their scheduled laboratory hours.',
    ),
    Facility(
      name: 'Gymnasium',
      image: 'assets/images/gymnasium.png',
      description:
          'A covered court used for physical education classes, sports '
          'events, intramurals, and school programs.',
    ),
    Facility(
      name: 'Cafeteria',
      image: 'assets/images/cafeteria.png',
      description:
          'Affordable meals, snacks, and drinks for students and staff, '
          'with seating areas for eating and relaxing between classes.',
    ),
    Facility(
      name: 'Science Laboratory',
      image: 'assets/images/science_lab.png',
      description:
          'A laboratory with the tools and safety equipment needed for '
          'hands-on experiments in chemistry, physics, and biology.',
    ),
    Facility(
      name: 'Auditorium',
      image: 'assets/images/auditorium.png',
      description:
          'A large hall for assemblies, seminars, performances, and '
          'graduation-related activities.',
    ),
  ];

  static const List<StudentService> services = [
    StudentService(
      title: 'Library Services',
      description: 'Book borrowing, research assistance, and reading areas.',
      schedule: 'Mon - Fri, 8:00 AM - 5:00 PM',
      icon: Icons.local_library,
    ),
    StudentService(
      title: 'Registrar\'s Office',
      description:
          'Enrollment, transcript and certificate requests, and student records.',
      schedule: 'Mon - Fri, 8:00 AM - 5:00 PM',
      icon: Icons.assignment_ind,
    ),
    StudentService(
      title: 'Clinic',
      description: 'First aid, health check-ups, and basic medical assistance.',
      schedule: 'Mon - Fri, 8:00 AM - 5:00 PM',
      icon: Icons.medical_services,
    ),
    StudentService(
      title: 'Guidance Office',
      description:
          'Student counseling, career guidance, and personal support.',
      schedule: 'Mon - Fri, 9:00 AM - 4:00 PM',
      icon: Icons.psychology,
    ),
    StudentService(
      title: 'Cashier',
      description: 'Payment of tuition, fees, and other school charges.',
      schedule: 'Mon - Fri, 8:00 AM - 4:00 PM',
      icon: Icons.payments,
    ),
    StudentService(
      title: 'Student Affairs',
      description: 'Student organizations, activities, and ID processing.',
      schedule: 'Mon - Fri, 8:00 AM - 5:00 PM',
      icon: Icons.groups,
    ),
  ];
}
