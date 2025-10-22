import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Homeschool Planner!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your homeschool planning dashboard will show an overview of:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text('• Today\'s schedule'),
            Text('• Upcoming assignments'),
            Text('• Student progress'),
            Text('• Recent activities'),
            SizedBox(height: 24),
            Text(
              'Get started by adding students and setting up your curriculum!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}