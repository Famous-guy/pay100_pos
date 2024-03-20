// import 'package:flutter/material.dart';

// // class User {
// //   final String? apiKey;
// //   // final String? email;

// //   User({this.apiKey});
// // }

// // class AuthProvider extends ChangeNotifier {
// //   User? _user;

// //   User? get user => _user;

// //   void signIn({required String apiKey}) {
// //     // Perform sign-in logic here
// //     _user = User(apiKey: apiKey);
// //     notifyListeners();
// //   }

// //   // void signOut() {
// //   //   // Perform sign-out logic here
// //   //   _user = null;
// //   //   notifyListeners();
// //   // }
// // }

// // class User {
// //   final String apiKey;

// //   User(this.apiKey);
// // }

// class AuthProvider extends ChangeNotifier {
//   String _apiKey = '';

//   String get apiKey => _apiKey;

//   void setApi(String setApiKey) {
//     _apiKey = setApiKey;
//     notifyListeners();
//   }
// }

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
