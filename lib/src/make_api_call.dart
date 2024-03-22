import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hundredpay/src/hundred_pay_response_model.dart';

class MakeApiCall {
  static Future<HundredPayResponseModel> makePayment({
    required String amount,
    required String customerEmail,
    required String customerPhoneNumber,
    required String customerName,
    required String customerUserId,
    required String refId,
    required String description,
    required String currency,
    required String country,
    required String callBackUrl,
    required Map metadata,
    required String chargeSource,
    required String userId,
    required String apiKey,
    required BuildContext context, // Add context parameter
  }) async {
    try {
      var headers = {'api-key': apiKey, "Content-Type": "application/json"};
      var url = Uri.parse("https://api.100pay.co/api/v1/pay/charge");
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({
            "ref_id": refId,
            "customer": {
              "user_id": customerUserId,
              "name": customerName,
              "phone": customerPhoneNumber,
              "email": customerEmail
            },
            "billing": {
              "description": description,
              "amount": amount,
              "country": country,
              "currency": currency,
              "vat": "10",
              "pricing_type": "fixed"
            },
            "metadata": metadata,
            "call_back_url": callBackUrl,
            "userId": userId,
            "charge_source": chargeSource
          }));

      if (response.statusCode.toString()[0] == "2") {
        return HundredPayResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase!);
      }
    } on SocketException catch (_) {
      // Show dialog for unstable network
      showDialog(
        context: context,
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
                title: Text('Network Unstable'),
                content:
                    Text('Please check your network connection and try again.'),
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
      throw Exception(_.toString());
    } catch (e) {
      // Show dialog for other exceptions
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
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
          );
        },
      );
      throw Exception(e.toString());
    }
  }
}
