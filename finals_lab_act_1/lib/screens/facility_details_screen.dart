import 'package:flutter/material.dart';

import '../models/facility.dart';
import '../routes/app_routes.dart';

/// Facility Details: shows the facility selected on the previous screen.
/// The data comes from the route arguments ([FacilityArguments]).
class FacilityDetailsScreen extends StatelessWidget {
  final FacilityArguments args;

  const FacilityDetailsScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(args.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: args.name,
              child: Image.asset(
                args.image,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 240,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image_not_supported, size: 48),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(args.name, style: theme.textTheme.headlineMedium),
                  const SizedBox(height: 12),
                  Text(args.description, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          // Navigator.pop returns to the previous screen.
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Back'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          // pushNamedAndRemoveUntil clears the stack back to Home.
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.home,
                            (route) => false,
                          ),
                          icon: const Icon(Icons.home),
                          label: const Text('Home'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
