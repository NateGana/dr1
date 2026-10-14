import 'package:flutter/material.dart';

import '../data/campus_data.dart';
import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/service_card.dart';

/// Student Services: ListView of available services.
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Services')),
      drawer: const AppDrawer(currentRoute: AppRoutes.services),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: CampusData.services.length,
        itemBuilder: (context, index) =>
            ServiceCard(service: CampusData.services[index]),
      ),
    );
  }
}
