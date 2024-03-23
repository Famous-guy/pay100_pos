import 'package:flutter/material.dart';

// Define a class for managing the API key
class AuthProvider with ChangeNotifier {
  String? _apiKey;

  // Method to set the API key
  void setApiKey(String apiKey) {
    _apiKey = apiKey;
    notifyListeners(); // Notify listeners of changes
  }

  // Method to get the API key
  String? get apiKey => _apiKey;
}
