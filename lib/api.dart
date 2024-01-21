import 'dart:convert';

// import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'test_model.dart';

class AppiCall {
  static Future<TestModel> makePayment({required String amount}) async {
    print(amount.replaceAll(",", ""));


    final prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString('apiKey');

    if (apiKey == null) {
      throw Exception('API key not found in Shared Preferences');
    }

    try {
      var headers = {'api-key': apiKey, "Content-Type": "application/json"};
      var url = Uri.parse("https://api.100pay.co/api/v1/pay/charge");
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({
            "ref_id": "012232",
            "customer": {
              "user_id": "111",
              "name": "Brainy Josh",
              "phone": "80123456789",
              "email": "user@site.com"
            },
            "billing": {
              "description": "MY TEST PAYMENT",
              "amount": amount.replaceAll(",", ""),
              "country": "NG",
              "currency": "NGN",
              "vat": "10",
              "pricing_type": "fixed"
            },
            "metadata": {"is_approved": "yes"},
            "call_back_url":
                "https://api.100pay.co/api/v1/pay/crypto/payment/65ab782a25c0b2003e84d4fc",
            "userId": "6143bfb7fe85e0020bf243f9",
            "charge_source": "api"
          }));
      print(response.body);

      if (response.statusCode.toString()[0] == "2") {
        return TestModel.fromJson(jsonDecode(response.body));
      } else {
        throw response.reasonPhrase!;
      }
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
