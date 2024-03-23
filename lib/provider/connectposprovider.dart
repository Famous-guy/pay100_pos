import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pay100_pos/api/connectpos.dart';
import 'package:pay100_pos/payos.dart';
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
