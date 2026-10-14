import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/campus_data.dart';
import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';

/// Home screen: welcome message and navigation links.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Back-button handling: ask before leaving the app from Home.
  Future<void> _confirmExit(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Exit Campus Explorer?'),
        content: const Text('Are you sure you want to close the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Exit'),
          ),
        ],
      ),
    );
    if (shouldExit == true) {
      SystemNavigator.pop(); // closes the app
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final links = <_NavLink>[
      _NavLink('About the Campus', Icons.info, AppRoutes.about),
      _NavLink('Campus Facilities', Icons.apartment, AppRoutes.facilities),
      _NavLink('Student Services', Icons.support_agent, AppRoutes.services),
      _NavLink('Contact Us', Icons.contact_phone, AppRoutes.contact),
    ];

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) _confirmExit(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Campus Explorer')),
        drawer: const AppDrawer(currentRoute: AppRoutes.home),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner with welcome message
              Stack(
                children: [
                  Image.asset(
                    CampusData.bannerImage,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.65),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to Campus Explorer!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          CampusData.schoolName,
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Discover our campus, browse facilities, and find the '
                  'student services you need - all in one app.',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              // Navigation links laid out in rows of two
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    for (var i = 0; i < links.length; i += 2)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Expanded(child: _NavTile(link: links[i])),
                            const SizedBox(width: 12),
                            Expanded(
                              child: i + 1 < links.length
                                  ? _NavTile(link: links[i + 1])
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink {
  final String label;
  final IconData icon;
  final String route;
  const _NavLink(this.label, this.icon, this.route);
}

class _NavTile extends StatelessWidget {
  final _NavLink link;
  const _NavTile({required this.link});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        // pushNamed keeps Home on the stack so the back button returns here.
        onTap: () => Navigator.pushNamed(context, link.route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 8),
          child: Column(
            children: [
              Icon(link.icon, size: 36, color: theme.colorScheme.primary),
              const SizedBox(height: 10),
              Text(
                link.label,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
