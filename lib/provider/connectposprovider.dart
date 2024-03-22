// // // import 'dart:js';

// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:pay100_pos/api/connectpos.dart';
// // // import 'package:pay100_pos/test.dart';
// // // import 'dart:convert';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // class UserDataProvider with ChangeNotifier {
// // //   UserData? _userData;

// // //   UserData? get userData => _userData;

// // //   Future<void> connectPOS(String inviteCode) async {
// // //     var url = Uri.parse('https://api.100pay.co/api/v1/user/connect-pos');
// // //     var body = {"accountId": inviteCode};
// // //     var headers = {"Content-Type": "application/json"};
// // //     var res = await http.post(url, body: jsonEncode(body), headers: headers);

// // //     if (res.statusCode == 200) {
// // //       print(res.body);
// // //       var data = jsonDecode(res.body);
// // //       print(data);
// // //       _userData = UserData.fromJson(data);
// // //       // Save data to shared preferences
// // //       print(data);
// // //       await saveUserDataToPrefs();
// // //       print(data);
// // //       Navigator.push(
// // //         context as BuildContext,
// // //         MaterialPageRoute(
// // //           builder: (context) => Pay100(),
// // //         ),
// // //       );
// // //       notifyListeners();
// // //       print(data);
// // //     } else {
// // //       AlertDialog(
// // //         title: Text('Error'),
// // //         content: Column(
// // //           children: [
// // //             Text('Invalid user id!'),
// // //             Text('Do check your 100pay app to signin to get one'),
// // //           ],
// // //         ),
// // //       );
// // //       print('the error is ${res.body}');
// // //     }
// // //   }

// // //   Future<void> saveUserDataToPrefs() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     await prefs.setString('publicKey', _userData!.publicKey);
// // //     await prefs.setString('email', _userData!.email);
// // //     await prefs.setString('phone', _userData!.phone);
// // //     await prefs.setString('accountName', _userData!.accountName);
// // //     await prefs.setString('currency', _userData!.currency);
// // //     await prefs.setString('accountId', _userData!.accountId);
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:pay100_pos/api/connectpos.dart';
// // import 'package:pay100_pos/test.dart';
// // import 'dart:convert';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class UserDataProvider with ChangeNotifier {
// //   UserData? _userData;

// //   UserData? get userData => _userData;

// //   Future<bool> connectPOS(BuildContext context, String inviteCode) async {
// //     var url = Uri.parse('https://api.100pay.co/api/v1/user/connect-pos');
// //     var body = {"accountId": inviteCode};
// //     var headers = {"Content-Type": "application/json"};
// //     var res = await http.post(url, body: jsonEncode(body), headers: headers);

// //     if (res.statusCode == 200) {
// //       print(res.body);
// //       var data = jsonDecode(res.body);
// //       print(data);
// //       _userData = UserData.fromJson(data);
// //       // Save data to shared preferences
// //       print(data);
// //       await saveUserDataToPrefs();
// //       print(data);
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => Pay100(),
// //         ),
// //       );
// //       notifyListeners();
// //       print(data);
// //       return true; // Connection successful
// //     } else {
// //       print('the error is ${res.body}');
// //       showDialog(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             elevation: 0,
// //             titleTextStyle: TextStyle(
// //               color: Colors.black,
// //               fontWeight: FontWeight.bold,
// //               fontFamily: 'space_grotesk',
// //               fontSize: 25,
// //             ),
// //             contentTextStyle: TextStyle(
// //               color: Colors.black,
// //               fontWeight: FontWeight.w400,
// //               fontFamily: 'space_grotesk',
// //               fontSize: 16,
// //             ),
// //             backgroundColor: Colors.white,
// //             title: Text(
// //               'Error',
// //               textAlign: TextAlign.center,
// //             ),
// //             content: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   'Invalid user id! Do check your 100pay app, or sign in to get one',
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 // Text('Do check your 100pay app to sign in to get one'),
// //               ],
// //             ),
// //             actions: <Widget>[
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //                 child: Text('OK'),
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //       return false; // Connection failed
// //     }
// //   }

// //   Future<void> saveUserDataToPrefs() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('publicKey', _userData!.publicKey);
// //     await prefs.setString('email', _userData!.email);
// //     await prefs.setString('phone', _userData!.phone);
// //     await prefs.setString('accountName', _userData!.accountName);
// //     await prefs.setString('currency', _userData!.currency);
// //     await prefs.setString('accountId', _userData!.accountId);
// //   }
// // }

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:pay100_pos/api/connectpos.dart';
// import 'package:pay100_pos/test.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserDataProvider with ChangeNotifier {
//   UserData? _userData;

//   UserData? get userData => _userData;

//   Future<bool> connectPOS(BuildContext context, String inviteCode) async {
//     var url = Uri.parse('https://api.100pay.co/api/v1/user/connect-pos');
//     var body = {"accountId": inviteCode};
//     var headers = {"Content-Type": "application/json"};
//     var res = await http.post(url, body: jsonEncode(body), headers: headers);

//     if (res.statusCode == 200) {
//       print(res.body);
//       var data = jsonDecode(res.body);
//       print(data);
//       _userData = UserData.fromJson(data);
//       // Save data to shared preferences
//       print(data);
//       await saveUserDataToPrefs();
//       print(data);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Pay100(),
//         ),
//       );
//       notifyListeners();
//       print(data);
//       return true; // Connection successful
//     } else {
//       print('the error is ${res.body}');
//       showDialog(
//         context: context,
//         barrierDismissible: false, // Prevents dismissing by tapping outside
//         builder: (BuildContext context) {
//           return Stack(
//             children: [
//               // Blurred background
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                 child: Container(
//                   color:
//                       Colors.black.withOpacity(0.5), // Adjust opacity as needed
//                 ),
//               ),
//               // AlertDialog
// AlertDialog(
//   elevation: 0,
//   titleTextStyle: TextStyle(
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'space_grotesk',
//     fontSize: 25,
//   ),
//   contentTextStyle: TextStyle(
//     color: Colors.black,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'space_grotesk',
//     fontSize: 16,
//   ),
//   backgroundColor: Colors.white,
//   title: Text(
//     'Error',
//     textAlign: TextAlign.center,
//   ),
//   content: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Text(
//         'Invalid user id! Do check your 100pay app, or sign in to get one',
//         textAlign: TextAlign.center,
//       ),
//     ],
//   ),
//   actions: <Widget>[
//     TextButton(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       child: Text('OK'),
//     ),
//   ],
// ),
//             ],
//           );
//         },
//       );
//       return false; // Connection failed
//     }
//   }

//   Future<void> saveUserDataToPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('publicKey', _userData!.publicKey);
//     await prefs.setString('email', _userData!.email);
//     await prefs.setString('phone', _userData!.phone);
//     await prefs.setString('accountName', _userData!.accountName);
//     await prefs.setString('currency', _userData!.currency);
//     await prefs.setString('accountId', _userData!.accountId);
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pay100_pos/api/connectpos.dart';
import 'package:pay100_pos/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  Future<bool> connectPOS(BuildContext context, String inviteCode) async {
    try {
      var url = Uri.parse('https://api.100pay.co/api/v1/user/connect-pos');
      var body = {"accountId": inviteCode};
      var headers = {"Content-Type": "application/json"};
      var res = await http.post(url, body: jsonEncode(body), headers: headers);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        _userData = UserData.fromJson(data);
        await saveUserDataToPrefs();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Pay100(),
          ),
        );
        notifyListeners();
        return true; // Connection successful
      } else {
        showDialog(
          context: context,
          barrierDismissible: false, // Prevents dismissing by tapping outside
          builder: (BuildContext context) {
            return Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), // Adjust opacity as needed
                  ),
                ),
                AlertDialog(
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'space_grotesk',
                    fontSize: 25,
                  ),
                  contentTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'space_grotesk',
                    fontSize: 16,
                  ),
                  backgroundColor: Colors.white,
                  title: Text(
                    'Error',
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Invalid user id! Do check your 100pay app, or sign in to get one',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              ],
            );
          },
        );
        return false; // Connection failed
      }
    } on SocketException catch (_) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents dismissing by tapping outside
        builder: (BuildContext context) {
          return Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color:
                      Colors.black.withOpacity(0.5), // Adjust opacity as needed
                ),
              ),
              AlertDialog(
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'space_grotesk',
                  fontSize: 25,
                ),
                contentTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'space_grotesk',
                  fontSize: 16,
                ),
                backgroundColor: Colors.white,
                title: Text(
                  'Network Unstable',
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Please check your network connection and try again.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            ],
          );
        },
      );
      return false; // Connection failed due to unstable network
    } catch (_) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents dismissing by tapping outside
        builder: (BuildContext context) {
          return Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color:
                      Colors.black.withOpacity(0.5), // Adjust opacity as needed
                ),
              ),
              AlertDialog(
                title: Text('Error'),
                content: Text('An error occurred. Please try again later.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            ],
          );
        },
      );
      return false; // Other unknown error
    }
  }

  Future<void> saveUserDataToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('publicKey', _userData!.publicKey);
    await prefs.setString('email', _userData!.email);
    await prefs.setString('phone', _userData!.phone);
    await prefs.setString('accountName', _userData!.accountName);
    await prefs.setString('currency', _userData!.currency);
    await prefs.setString('accountId', _userData!.accountId);
  }
}
