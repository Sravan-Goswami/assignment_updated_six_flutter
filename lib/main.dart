import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider

// Import all screens
import 'package:assignment_updated_six_flutter/screenS/course_detail_screen.dart';
import 'package:assignment_updated_six_flutter/screenS/courses_screen.dart';
import 'package:assignment_updated_six_flutter/screenS/create_account_screen.dart';
import 'package:assignment_updated_six_flutter/screenS/dashboard_screen.dart';
import 'package:assignment_updated_six_flutter/screenS/login_screen.dart';
import 'package:assignment_updated_six_flutter/screenS/profile_screen.dart';

// Import your UserData model
import 'package:assignment_updated_six_flutter/models/user_data.dart'; // <--- ADD THIS

void main() {
  runApp(
    // Wrap the entire app with ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => UserData(), // Provide an instance of UserData
      child: const StudentPortalApp(),
    ),
  );
}

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            minimumSize: const Size(double.infinity, 50), // Full width button
          ),
        ),
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const LoginScreen(),
        '/createAccount': (context) => const CreateAccountScreen(),
        // DashboardScreen will now get the name from Provider
        '/dashboard': (context) => const DashboardScreen(), // Remove userName here
        // ProfileScreen will also get data from Provider
        '/profile': (context) => const ProfileScreen(), // Remove name, email, etc. here
        '/courses': (context) => const CoursesScreen(),
        // No explicit named route for course detail, will use push for data passing
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/courseDetail') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return CourseDetailScreen(
                courseName: args['courseName']!,
                courseDescription: args['courseDescription']!,
              );
            },
          );
        }
        return MaterialPageRoute(builder: (context) => const Text('Error: Unknown Route'));
      },
    );
  }
}