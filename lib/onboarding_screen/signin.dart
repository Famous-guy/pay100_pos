// // // import 'package:flutter/material.dart';
// // // import 'package:pay100_pos/provider/auth.dart';
// // // import 'package:pay100_pos/test.dart';
// // // import 'package:provider/provider.dart';

// // // class SignIn extends StatefulWidget {
// // //   const SignIn({Key? key}) : super(key: key);

// // //   @override
// // //   State<SignIn> createState() => _SignInState();
// // // }

// // // class _SignInState extends State<SignIn> {
// // //   final apiKeyController = TextEditingController();
// // //   final emailController = TextEditingController();
// // //   final usernameController = TextEditingController();
// // //   bool _isEmailValid = true;
// // //   bool _isUsernameValid = true;
// // //   bool _isApiKeyValid = true;
// // //   bool _isLoading = false;
// // //   bool _isDarkMode = false; // Track the current theme mode

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     String imageAssetPath = _isDarkMode
// // //         ? 'assets/images/100pay200.png'
// // //         : 'assets/images/100pay.png';

// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
// // //       home: Scaffold(
// // //         // backgroundColor: Colors.grey.shade100,
// // //         body: SafeArea(
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(20),
// // //             child: Column(
// // //               children: [
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.end,
// // //                   children: [
// // //                     // Text('Dark Mode'),
// // //                     Switch(
// // //                       value: _isDarkMode,
// // //                       onChanged: (value) {
// // //                         setState(() {
// // //                           _isDarkMode = value;
// // //                         });
// // //                       },
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 Container(
// // //                   margin: EdgeInsets.only(top: 10),
// // //                   child: Image.asset(
// // //                     imageAssetPath,
// // //                     width: 100,
// // //                   ),
// // //                 ),
// // //                 Expanded(
// // //                   child: Column(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: [
// // //                       Align(
// // //                         alignment: Alignment.centerLeft,
// // //                         child: Text(
// // //                           'Connect to your wallet',
// // //                           style: TextStyle(
// // //                               fontSize: 20, fontWeight: FontWeight.w700),
// // //                         ),
// // //                       ),
// // //                       SizedBox(height: 20),
// // //                       _buildApiKeyField(),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 Align(
// // //                   alignment: Alignment.bottomRight,
// // //                   child: SizedBox(
// // //                     height: 48,
// // //                     width: 136,
// // //                     child: _isLoading
// // //                         ? ElevatedButton(
// // //                             onPressed: () {},
// // //                             style: ElevatedButton.styleFrom(
// // //                               shape: RoundedRectangleBorder(
// // //                                   borderRadius: BorderRadius.circular(15)),
// // //                               backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
// // //                             ),
// // //                             child: CircularProgressIndicator(
// // //                               valueColor:
// // //                                   AlwaysStoppedAnimation<Color>(Colors.white),
// // //                             ),
// // //                           )
// // //                         : ElevatedButton(
// // //                             onPressed: () {
// // //                               setState(() {
// // //                                 _isLoading = true;

// // //                                 Future.delayed(Duration(seconds: 5), () {
// // //                                   if (apiKeyController.text.isEmpty) {
// // //                                     _showErrorMessage();
// // //                                     _isLoading = false;
// // //                                     return;
// // //                                   }

// // //                                   _isApiKeyValid =
// // //                                       _validateApiKey(apiKeyController.text);

// // //                                   if (
// // //                                       // _isEmailValid &&
// // //                                       //   _isUsernameValid &&
// // //                                       _isApiKeyValid) {
// // //                                     Provider.of<AuthProvider>(context,
// // //                                             listen: false)
// // //                                         .apiKey
// // //                                         .contains(apiKeyController.text);
// // //                                     Navigator.push(
// // //                                       context,
// // //                                       MaterialPageRoute(
// // //                                         builder: (context) => Pay100(
// // //                                             // apikey: apiKeyController.text,
// // //                                             ),
// // //                                       ),
// // //                                     );
// // //                                   }

// // //                                   _isLoading = false;
// // //                                 });
// // //                               });
// // //                             },
// // //                             style: ElevatedButton.styleFrom(
// // //                               shape: RoundedRectangleBorder(
// // //                                   borderRadius: BorderRadius.circular(15)),
// // //                               backgroundColor: Color.fromRGBO(242, 8, 49, 1),
// // //                             ),
// // //                             child: Row(
// // //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                               children: [
// // //                                 Text(
// // //                                   'Continue',
// // //                                   style: TextStyle(
// // //                                       color: Color.fromRGBO(255, 255, 255, 1),
// // //                                       fontWeight: FontWeight.w600,
// // //                                       fontSize: 14),
// // //                                 ),
// // //                                 Icon(
// // //                                   Icons.arrow_forward_ios,
// // //                                   size: 16,
// // //                                   weight: 100,
// // //                                   color: Colors.white,
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                   ),
// // //                 ),
// // //                 // SizedBox(height: 20),
// // //                 // Row(
// // //                 //   mainAxisAlignment: MainAxisAlignment.center,
// // //                 //   children: [
// // //                 //     Text('Dark Mode'),
// // //                 //     Switch(
// // //                 //       value: _isDarkMode,
// // //                 //       onChanged: (value) {
// // //                 //         setState(() {
// // //                 //           _isDarkMode = value;
// // //                 //         });
// // //                 //       },
// // //                 //     ),
// // //                 //   ],
// // //                 // ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildApiKeyField() {
// // //     return TextField(
// // //       controller: apiKeyController,
// // //       decoration: InputDecoration(
// // //         border: OutlineInputBorder(
// // //             borderRadius: BorderRadius.all(Radius.circular(15))),
// // //         hintText: 'Enter your wallet account ID',
// // //         errorText: _isApiKeyValid ? null : 'Invalid API key',
// // //       ),
// // //       onChanged: (value) {
// // //         setState(() {
// // //           _isApiKeyValid = _validateApiKey(value);
// // //         });
// // //       },
// // //     );
// // //   }

// // //   bool _validateApiKey(String value) {
// // //     if (value.startsWith('LIVE;PK;ey')) {
// // //       return true;
// // //     } else {
// // //       return false;
// // //     }
// // //   }

// // //   void _showErrorMessage() {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text('Error: Please input a value.'),
// // //         duration: Duration(seconds: 1),
// // //       ),
// // //     );
// // //     _isLoading = false;
// // //   }
// // // }
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pay100_pos/provider/auth.dart';
// // import 'package:pay100_pos/test.dart';
// // import 'package:provider/provider.dart';

// // class SignIn extends StatefulWidget {
// //   const SignIn({Key? key}) : super(key: key);

// //   @override
// //   State<SignIn> createState() => _SignInState();
// // }

// // class _SignInState extends State<SignIn> {
// //   final apiKeyController = TextEditingController();
// //   final emailController = TextEditingController();
// //   final usernameController = TextEditingController();
// //   bool _isEmailValid = true;
// //   bool _isUsernameValid = true;
// //   bool _isApiKeyValid = true;
// //   bool _isLoading = false;
// //   bool _isDarkMode = false; // Track the current theme mode

// //   @override
// //   Widget build(BuildContext context) {
// //     String imageAssetPath = _isDarkMode
// //         ? 'assets/images/100pay200.png'
// //         : 'assets/images/100pay.png';

// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
// //       home: Scaffold(
// //         // backgroundColor: Colors.grey.shade100,
// //         body: SafeArea(
// //           child: Padding(
// //             padding: const EdgeInsets.all(20),
// //             child: Column(
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.end,
// //                   children: [
// //                     // Text('Dark Mode'),
// //                     Switch(
// //                       value: _isDarkMode,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           _isDarkMode = value;
// //                         });
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 Container(
// //                   margin: EdgeInsets.only(top: 10),
// //                   child: Image.asset(
// //                     imageAssetPath,
// //                     width: 100,
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Align(
// //                         alignment: Alignment.centerLeft,
// //                         child: Text(
// //                           'Connect to your wallet',
// //                           style: TextStyle(
// //                               fontSize: 20, fontWeight: FontWeight.w700),
// //                         ),
// //                       ),
// //                       SizedBox(height: 20),
// //                       _buildApiKeyField(),
// //                     ],
// //                   ),
// //                 ),
// //                 Align(
// //                   alignment: Alignment.bottomRight,
// //                   child: SizedBox(
// //                     height: 48,
// //                     width: 136,
// //                     child: _isLoading
// //                         ? ElevatedButton(
// //                             onPressed: () {},
// //                             style: ElevatedButton.styleFrom(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(15)),
// //                               backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
// //                             ),
// //                             child: CircularProgressIndicator(
// //                               valueColor:
// //                                   AlwaysStoppedAnimation<Color>(Colors.white),
// //                             ),
// //                           )
// //                         : ElevatedButton(
// //                             onPressed: () {
// //                               setState(() {
// //                                 _isLoading = true;

// //                                 Future.delayed(Duration(seconds: 5), () async {
// //                                   if (apiKeyController.text.isEmpty) {
// //                                     _showErrorMessage();
// //                                     _isLoading = false;
// //                                     return;
// //                                   }

// //                                   _isApiKeyValid =
// //                                       _validateApiKey(apiKeyController.text);

// //                                   if (
// //                                       // _isEmailValid &&
// //                                       //   _isUsernameValid &&
// //                                       _isApiKeyValid) {
// //                                     final apiKeyProvider =
// //                                         Provider.of<AuthProvider>(context,
// //                                             listen: false);
// //                                     apiKeyProvider
// //                                         .setApiKey(apiKeyController.text);

// //                                     await storeApiKey(apiKeyController.text);
// //                                     Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                         builder: (context) => Pay100(),
// //                                       ),
// //                                     );
// //                                   }

// //                                   _isLoading = false;
// //                                 });
// //                               });
// //                             },
// //                             style: ElevatedButton.styleFrom(
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(15)),
// //                               backgroundColor: Color.fromRGBO(242, 8, 49, 1),
// //                             ),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   'Continue',
// //                                   style: TextStyle(
// //                                       color: Color.fromRGBO(255, 255, 255, 1),
// //                                       fontWeight: FontWeight.w600,
// //                                       fontSize: 14),
// //                                 ),
// //                                 Icon(
// //                                   Icons.arrow_forward_ios,
// //                                   size: 16,
// //                                   weight: 100,
// //                                   color: Colors.white,
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                   ),
// //                 ),
// //                 // SizedBox(height: 20),
// //                 // Row(
// //                 //   mainAxisAlignment: MainAxisAlignment.center,
// //                 //   children: [
// //                 //     Text('Dark Mode'),
// //                 //     Switch(
// //                 //       value: _isDarkMode,
// //                 //       onChanged: (value) {
// //                 //         setState(() {
// //                 //           _isDarkMode = value;
// //                 //         });
// //                 //       },
// //                 //     ),
// //                 //   ],
// //                 // ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // Widget _buildApiKeyField() {
// //   //   return TextField(
// //   //     controller: apiKeyController,
// //   //     decoration: InputDecoration(
// //   //       border: OutlineInputBorder(
// //   //           borderRadius: BorderRadius.all(Radius.circular(15))),
// //   //       hintText: 'Enter your wallet account ID',
// //   //       errorText: _isApiKeyValid ? null : 'Invalid API key',
// //   //     ),
// //   //     onChanged

// // //   Widget _buildApiKeyField() {
// // //     return TextField(
// // //       controller: apiKeyController,
// // //       decoration: InputDecoration(
// // //         border: OutlineInputBorder(
// // //             borderRadius: BorderRadius.all(Radius.circular(15))),
// // //         hintText: 'Enter your wallet account ID',
// // //         errorText: _isApiKeyValid ? null : 'Invalid API key',
// // //       ),
// // //       onChanged: (value) {
// // //         setState(() {
// // //           _isApiKeyValid = _validateApiKey(value);
// // //         });
// // //       },
// // //     );
// // //   }

// // //   bool _validateApiKey(String value) {
// // //     if (value.startsWith('LIVE;PK;ey')) {
// // //       return true;
// // //     } else {
// // //       return false;
// // //     }
// // //   }

// // //   void _showErrorMessage() {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text('Error: Please input a value.'),
// // //         duration: Duration(seconds: 1),
// // //       ),
// // //     );
// // //     _isLoading = false;
// // //   }

// //   Widget _buildApiKeyField() {
// //     return TextField(
// //       controller: apiKeyController,
// //       decoration: InputDecoration(
// //         border: OutlineInputBorder(
// //             borderRadius: BorderRadius.all(Radius.circular(15))),
// //         hintText: 'Enter your wallet account ID',
// //         errorText: _isApiKeyValid ? null : 'Invalid API key',
// //       ),
// //       onChanged: (value) {
// //         setState(() {
// //           _isApiKeyValid = _validateApiKey(value);
// //         });
// //       },
// //     );
// //   }

// //   bool _validateApiKey(String value) {
// //     if (value.startsWith('LIVE;PK;ey')) {
// //       return true;
// //     } else {
// //       return false;
// //     }
// //   }

// //   void _showErrorMessage() {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text('Error: Please input a value.'),
// //         duration: Duration(seconds: 1),
// //       ),
// //     );
// //     _isLoading = false;
// //   }

// //   // Future<void> storeApiKey(String apiKey) async {
// //   //   try {
// //   //     FirebaseFirestore firestore = FirebaseFirestore.instance;
// //   //     CollectionReference users = firestore.collection('users');

// //   //     // Get the current user ID (you need to implement your own logic to get the user ID)
// //   //     String userId = ''; // Add your logic to get the user ID

// //   //     // Store the API key in Firestore
// //   //     await users.doc(userId).set({'apiKey': apiKey});
// //   //   } catch (error) {
// //   //     print('Error storing API key: $error');
// //   //     // Handle any errors that occur during API key storage
// //   //   }
// //   // }

// //   Future<void> storeApiKey(String apiKey) async {
// //     try {
// //       final firestore = FirebaseFirestore.instance;
// //       final users = firestore.collection('users');
// //       final userId = ''; // You need to implement logic to get the user ID
// //       await users.doc(userId).set({'apiKey': apiKey});
// //     } catch (error) {
// //       print('Error storing API key: $error');
// //     }
// //   }
// // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:pay100_pos/provider/auth.dart';
// import 'package:pay100_pos/test.dart';
// import 'package:provider/provider.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final apiKeyController = TextEditingController();
//   bool _isApiKeyValid = true;
//   bool _isLoading = false;
//   bool _isDarkMode = false; // Track the current theme mode

//   @override
//   Widget build(BuildContext context) {
//     String imageAssetPath = _isDarkMode
//         ? 'assets/images/100pay200.png'
//         : 'assets/images/100pay.png';

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Switch(
//                       value: _isDarkMode,
//                       onChanged: (value) {
//                         setState(() {
//                           _isDarkMode = value;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: Image.asset(
//                     imageAssetPath,
//                     width: 100,
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Connect to your wallet',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w700),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       _buildApiKeyField(),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: SizedBox(
//                     height: 48,
//                     width: 136,
//                     child: _isLoading
//                         ? ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15)),
//                               backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
//                             ),
//                             child: CircularProgressIndicator(
//                               valueColor:
//                                   AlwaysStoppedAnimation<Color>(Colors.white),
//                             ),
//                           )
//                         : ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 _isLoading = true;

//                                 Future.delayed(Duration(seconds: 5), () async {
//                                   if (apiKeyController.text.isEmpty) {
//                                     _showErrorMessage();
//                                     _isLoading = false;
//                                     return;
//                                   }

//                                   _isApiKeyValid =
//                                       _validateApiKey(apiKeyController.text);

//                                   if (_isApiKeyValid) {
//                                     final apiKeyProvider =
//                                         Provider.of<AuthProvider>(context,
//                                             listen: false);
//                                     apiKeyProvider
//                                         .setApiKey(apiKeyController.text);

//                                     // await storeApiKey(apiKeyController.text);
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Pay100(),
//                                       ),
//                                     );
//                                   }

//                                   _isLoading = false;
//                                 });
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15)),
//                               backgroundColor: Color.fromRGBO(242, 8, 49, 1),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Continue',
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(255, 255, 255, 1),
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                                 Icon(
//                                   Icons.arrow_forward_ios,
//                                   size: 16,
//                                   weight: 100,
//                                   color: Colors.white,
//                                 ),
//                               ],
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildApiKeyField() {
//     return TextField(
//       controller: apiKeyController,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(15))),
//         hintText: 'Enter your wallet account ID',
//         errorText: _isApiKeyValid ? null : 'Invalid API key',
//       ),
//       onChanged: (value) {
//         setState(() {
//           _isApiKeyValid = _validateApiKey(value);
//         });
//       },
//     );
//   }

//   bool _validateApiKey(String value) {
//     return value.startsWith('LIVE;PK;ey');
//   }

//   void _showErrorMessage() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: Please input a value.'),
//         duration: Duration(seconds: 1),
//       ),
//     );
//     _isLoading = false;
//   }

//   // Future<void> storeApiKey(String apiKey) async {
//   //   try {
//   //     final firestore = FirebaseFirestore.instance;
//   //     final users = firestore.collection('users');
//   //     final userId = ''; // You need to implement logic to get the user ID
//   //     await users.doc(userId).set({'apiKey': apiKey});
//   //   } catch (error) {
//   //     print('Error storing API key: $error');
//   //   }
//   // }
// }

import 'package:flutter/material.dart';
import 'package:pay100_pos/provider/auth.dart';
import 'package:pay100_pos/test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final apiKeyController = TextEditingController();
  bool _isApiKeyValid = true;
  bool _isLoading = false;
  bool _isDarkMode = false; // Track the current theme mode

  @override
  Widget build(BuildContext context) {
    String imageAssetPath = _isDarkMode
        ? 'assets/images/100pay200.png'
        : 'assets/images/100pay.png';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      value: _isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          _isDarkMode = value;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    imageAssetPath,
                    width: 100,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Connect to your wallet',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildApiKeyField(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 48,
                    width: 136,
                    child: _isLoading
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
                            ),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isLoading = true;

                                Future.delayed(Duration(seconds: 5), () async {
                                  if (apiKeyController.text.isEmpty) {
                                    _showErrorMessage();
                                    _isLoading = false;
                                    return;
                                  }

                                  _isApiKeyValid =
                                      _validateApiKey(apiKeyController.text);

                                  if (_isApiKeyValid) {
                                    // Save API key to local storage
                                    await saveApiKey(apiKeyController.text);

                                    // Navigate to the next screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pay100(),
                                      ),
                                    );
                                  }

                                  _isLoading = false;
                                });
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  weight: 100,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildApiKeyField() {
    return TextField(
      controller: apiKeyController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: 'Enter your wallet account ID',
        errorText: _isApiKeyValid ? null : 'Invalid API key',
      ),
      onChanged: (value) {
        setState(() {
          _isApiKeyValid = _validateApiKey(value);
        });
      },
    );
  }

  bool _validateApiKey(String value) {
    return value.startsWith('LIVE;PK;ey');
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: Please input a value.'),
        duration: Duration(seconds: 1),
      ),
    );
    _isLoading = false;
  }

  Future<void> saveApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiKey', apiKey);
    print('API key saved successfully: $apiKey');
  }
}
