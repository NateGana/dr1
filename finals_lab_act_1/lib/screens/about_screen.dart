import 'package:flutter/material.dart';

import '../data/campus_data.dart';
import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';

/// About the Campus: school information and history.
/// NOTE: Replace the placeholder history text with your school's real details.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('About the Campus')),
      drawer: const AppDrawer(currentRoute: AppRoutes.about),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              CampusData.bannerImage,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(CampusData.schoolName, style: theme.textTheme.headlineMedium),
          Text(CampusData.schoolLocalName, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: theme.colorScheme.secondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(CampusData.address, style: theme.textTheme.bodyLarge),
              ),
            ],
          ),
          const Divider(height: 32),
          Text('Our History', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'The University of Cabuyao (Pamantasan ng Cabuyao) is a local '
            'university committed to providing accessible and quality higher '
            'education to the people of Cabuyao, Laguna and nearby communities. '
            'Since its establishment, it has continued to grow its programs, '
            'facilities, and student services.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Text('Mission', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'To provide quality education that develops competent, '
            'responsible, and service-oriented graduates.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Text('Vision', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'A leading local university recognized for excellence, innovation, '
            'and community engagement.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.facilities),
            icon: const Icon(Icons.apartment),
            label: const Text('Explore Campus Facilities'),
          ),
        ],
      ),
    );
  }
}
