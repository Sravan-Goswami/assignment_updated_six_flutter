// lib/models/user_data.dart
import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  String _fullName = 'Guest';
  String _email = 'guest@example.com';

  String get fullName => _fullName;
  String get email => _email;

  void setUserDetails(String name, String email) {
    _fullName = name;
    _email = email;
    notifyListeners(); // Notify any widgets listening to this data
  }
}