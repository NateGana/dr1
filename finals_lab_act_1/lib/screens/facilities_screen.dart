import 'package:flutter/material.dart';

import '../data/campus_data.dart';
import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/facility_card.dart';

/// Campus Facilities: GridView of facilities (6 items).
/// Tapping a card navigates to the details screen and passes the facility
/// name, image and description through route arguments.
class FacilitiesScreen extends StatelessWidget {
  const FacilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Facilities')),
      drawer: const AppDrawer(currentRoute: AppRoutes.facilities),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive: more columns on wider screens.
          final width = constraints.maxWidth;
          final columns = width >= 900 ? 4 : (width >= 600 ? 3 : 2);

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.95,
            ),
            itemCount: CampusData.facilities.length,
            itemBuilder: (context, index) {
              final facility = CampusData.facilities[index];
              return FacilityCard(
                facility: facility,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.facilityDetails,
                    arguments: facility.toArguments(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
