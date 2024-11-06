import 'package:flutter/material.dart';
import 'package:travelling_app/views/placeByIdComponents/reviews_by_userId.dart';

class UserProvider with ChangeNotifier {
  String _userId = '';
  String _name = '';

  // Getter for userId
  String get userId => _userId;

  // Getter for name
  String get name => _name;

  // Method to set user data (e.g., after decoding a token)
  void setUserData(String userId) {
    _userId = userId;
    // ReviewsByUserid();
  }

  // Example of updating a single property
  void updateName(String newName) {
    _name = newName;
    notifyListeners();  // Notify listeners whenever state changes
  }
}
