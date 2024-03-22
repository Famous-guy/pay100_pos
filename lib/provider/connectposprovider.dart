import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pay100_pos/api/connectpos.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  Future<void> connectPOS(String inviteCode) async {
    var url = Uri.parse('https://api.100pay.co/api/v1/user/connect-pos');
    var body = {"accountId": inviteCode};
    var headers = {"Content-Type": "application/json"};
    var res = await http.post(url, body: jsonEncode(body), headers: headers);

    if (res.statusCode == 200) {
      print(res.body);
      var data = jsonDecode(res.body);
      print(data);
      _userData = UserData.fromJson(data);
      // Save data to shared preferences
      print(data);
      await saveUserDataToPrefs();
      print(data);
      notifyListeners();
      print(data);
    } else {
      AlertDialog(
        title: Text('Error'),
        content: Column(
          children: [
            Text('Invalid user id!'),
            Text('Do check your 100pay app to signin to get one'),
          ],
        ),
      );
      print('the error is ${res.body}');
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
