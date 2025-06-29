import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  final List<Map<String, String>> courses = const [
    {
      'name': 'Flutter Basics',
      'description': 'Introduction to Flutter.',
      'fullDescription': 'This course covers the fundamentals of Flutter development, including widgets, layout, state management, and basic navigation. Perfect for beginners.',
    },
    {
      'name': 'Dart Language',
      'description': 'Learn Dart in depth.',
      'fullDescription': 'Dive deep into the Dart programming language, the foundation of Flutter. Learn about variables, control flow, functions, classes, and asynchronous programming.',
    },
    {
      'name': 'Advanced Flutter UI',
      'description': 'Master complex UI designs.',
      'fullDescription': 'Explore advanced UI concepts, custom painters, animations, and complex widget trees to create stunning user interfaces in Flutter.',
    },
    {
      'name': 'State Management in Flutter',
      'description': 'Manage app state efficiently.',
      'fullDescription': 'Understand various state management solutions like Provider, BLoC, Riverpod, and GetX to build scalable and maintainable Flutter applications.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // Go back
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: courses.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              title: Text(
                course['name']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                course['description']!,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              onTap: () {
                // Navigate to CourseDetailScreen using Navigator.push and passing arguments
                Navigator.of(context).pushNamed(
                  '/courseDetail',
                  arguments: {
                    'courseName': course['name']!,
                    'courseDescription': course['fullDescription']!,
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}