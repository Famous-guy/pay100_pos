import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pay100_pos/api/connectpos.dart';
import 'package:pay100_pos/main.dart';

class PaymentProvider with ChangeNotifier {
  Future<void> fetchPaymentData(
      {required String auth_token, required String businessID}) async {
    try {
      // if (businessID.length != 24) {
      //   throw FormatException('Invalid businessID format');
      // }
      final String apiUrl =
          'https://api.100pay.co/api/v1/app/payments/$businessID';
      final String authToken = auth_token;
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDk3MGZiZGY2ZGJhZjAxMWY3MjkyYmUiLCJpYXQiOjE3MTE2MjAyMDV9.zS0cKfA0ua8IZIYJK2lbHQEZ8loDjKpvf6eQPnXmZ_g';
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          // 'Authorization':
          //     'Bearer Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTk5YTRmNDU1NjAzMjAwMmIyYjUxYzkiLCJpYXQiOjE3MTE2MzAxMDR9.o3MSIMYUa1RZ7jdqAWljJ-if_ZWoehtpEZ82P0omI_c',
          'auth-token': authToken
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // You can handle the data here as needed
        print(data);
      } else {
        throw Exception('Failed to load payment data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
