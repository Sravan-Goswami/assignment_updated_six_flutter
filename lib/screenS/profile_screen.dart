// screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:assignment_updated_six_flutter/models/user_data.dart'; // Import your UserData model

class ProfileScreen extends StatelessWidget {
  // Remove all the constructor parameters
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access UserData using context.watch to listen for changes and rebuild
    final userData = context.watch<UserData>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  userData.fullName.isNotEmpty ? userData.fullName[0].toUpperCase() : '?',
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileInfoRow(context, Icons.person, 'Full Name:', userData.fullName),
            const Divider(),
            _buildProfileInfoRow(context, Icons.email, 'Email:', userData.email),
            const Divider(),
            _buildProfileInfoRow(context, Icons.book, 'Courses Enrolled:', '12'), // Example static
            const Divider(),
            _buildProfileInfoRow(context, Icons.military_tech, 'Badges Earned:', '5'), // Example static
            const Divider(),
            _buildProfileInfoRow(context, Icons.leaderboard, 'Global Rank:', '23'), // Example static
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Example: navigate back to dashboard or logout
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey[700]),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}