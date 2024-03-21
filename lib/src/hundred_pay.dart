import 'package:flutter/material.dart';
import 'package:hundredpay/src/hundred_pay_response_model.dart';

import 'make_api_call.dart';
import 'pay_ui.dart';

class HundredPay {
  static Future<HundredPayResponseModel>? s;
  static makePayment({
    required String customerEmail,
    required String customerPhoneNumber,
    required String customerName,
    required String customerUserId,
    required String amount,
    required String userId,
    required String refId,
    required String description,
    required String apiKey,
    required String currency,
    required String country,
    required String chargeSource,
    required String callBackUrl,
    required Function(Object? error) onError,
    Map? metadata,
    required BuildContext? context,
  }) async {
    if (apiKey.isEmpty) {
      throw Exception("Please provide api key from the dashboard");
    }
    if (context == null) {
      throw Exception("Please provide a context");
    }
    Map metadata0 = {};
    if (metadata == null) {
      metadata0 = {"is_approved": "yes"};
    } else {
      metadata0 = metadata;
    }
    s = MakeApiCall.makePayment(
        amount: amount,
        customerEmail: customerEmail,
        customerPhoneNumber: customerPhoneNumber,
        customerName: customerName,
        customerUserId: customerUserId,
        refId: refId,
        description: description,
        currency: currency,
        country: country,
        callBackUrl: callBackUrl,
        metadata: metadata0,
        chargeSource: chargeSource,
        userId: userId,
        apiKey: apiKey);
    s!.onError((error, stackTrace) async {
      onError(error);
      throw error!;
    });
    showWebviewModal(
      context: context,
      amount: amount,
      callBackUrl: callBackUrl,
      metadata: metadata0,
      customerEmail: customerEmail,
      customerName: customerName,
      customerPhoneNumber: customerPhoneNumber,
      customerUserId: customerUserId,
      refId: refId,
      description: description,
      chargeSource: chargeSource,
      country: country,
      currency: country,
      userId: userId,
      apiKey: apiKey,
    );
  }

  static showWebviewModal({
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
    required String chargeSource,
    required Map metadata,
    required String userId,
    required String apiKey,
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (BuildContext bc) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          height: MediaQuery.of(context).size.height * 0.9,
          child: FutureBuilder<HundredPayResponseModel>(
              future: s,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  throw snapshot.error!;
                }
                return PayUi(
                  url: snapshot.data!.hostedUrl!,
                );
              }),
        );
      },
    );
  }
}
