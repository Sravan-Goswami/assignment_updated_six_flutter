// screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:assignment_updated_six_flutter/models/user_data.dart'; // Import your UserData model

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key}); // Remove the userName parameter

  @override
  Widget build(BuildContext context) {
    // Access UserData using context.watch to listen for changes and rebuild
    final userData = context.watch<UserData>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${userData.fullName}!', // Display the name from Provider
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'This is your personalized dashboard.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/courses');
              },
              child: const Text('View Courses'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('View Profile'),
            ),
          ],
        ),
      ),
    );
  }
}