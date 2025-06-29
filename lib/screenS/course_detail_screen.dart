import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseName;
  final String courseDescription;

  const CourseDetailScreen({
    super.key,
    required this.courseName,
    required this.courseDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // Go back
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                courseName,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Course Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              courseDescription,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Simulate starting the course
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Starting "$courseName" course!'),
                      backgroundColor: Colors.blue,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      margin: const EdgeInsets.all(16.0),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start Course'),
              ),
            ),
            const SizedBox(height: 20),
            // Additional course details could go here
            const Text(
              'Course Content:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildCourseContentItem('Introduction to Widgets'),
            _buildCourseContentItem('Building Layouts'),
            _buildCourseContentItem('State Management Basics'),
            _buildCourseContentItem('Handling User Input'),
            // ... more content
          ],
        ),
      ),
    );
  }

  Widget _buildCourseContentItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
