import 'package:flutter/material.dart';

/// A student service shown in the ListView.
class StudentService {
  final String title;
  final String description;
  final String schedule;
  final IconData icon;

  const StudentService({
    required this.title,
    required this.description,
    required this.schedule,
    required this.icon,
  });
}
