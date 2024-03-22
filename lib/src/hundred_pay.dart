import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hundredpay/src/hundred_pay_response_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'make_api_call.dart';
import 'pay_ui.dart';

class HundredPay {
  static Future<HundredPayResponseModel>? s;
  // static makePayment({
  //   required String customerEmail,
  //   required String customerPhoneNumber,
  //   required String customerName,
  //   required String customerUserId,
  //   required String amount,
  //   required String userId,
  //   required String refId,
  //   required String description,
  //   required String apiKey,
  //   required String currency,
  //   required String country,
  //   required String chargeSource,
  //   required String callBackUrl,
  //   required Function(Object? error) onError,
  //   Map? metadata,
  //   required BuildContext? context,
  // }) async {
  //   if (apiKey.isEmpty) {
  //     throw Exception("Please provide api key from the dashboard");
  //   }
  //   if (context == null) {
  //     throw Exception("Please provide a context");
  //   }
  //   Map metadata0 = {};
  //   if (metadata == null) {
  //     metadata0 = {"is_approved": "yes"};
  //   } else {
  //     metadata0 = metadata;
  //   }
  //   s = MakeApiCall.makePayment(
  //       amount: amount,
  //       customerEmail: customerEmail,
  //       customerPhoneNumber: customerPhoneNumber,
  //       customerName: customerName,
  //       customerUserId: customerUserId,
  //       refId: refId,
  //       description: description,
  //       currency: currency,
  //       country: country,
  //       callBackUrl: callBackUrl,
  //       metadata: metadata0,
  //       chargeSource: chargeSource,
  //       userId: userId,
  //       apiKey: apiKey,
  //       context: null);
  //   s!.onError((error, stackTrace) async {
  //     onError(error);
  //     throw error!;
  //   });
  //   showWebviewModal(
  //     context: context,
  //     amount: amount,
  //     callBackUrl: callBackUrl,
  //     metadata: metadata0,
  //     customerEmail: customerEmail,
  //     customerName: customerName,
  //     customerPhoneNumber: customerPhoneNumber,
  //     customerUserId: customerUserId,
  //     refId: refId,
  //     description: description,
  //     chargeSource: chargeSource,
  //     country: country,
  //     currency: country,
  //     userId: userId,
  //     apiKey: apiKey,
  //   );
  // }

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
    required BuildContext context, // Change BuildContext? to BuildContext
  }) async {
    if (apiKey.isEmpty) {
      throw Exception("Please provide api key from the dashboard");
    }
    if (context == null) {
      // Remove this check as context is required and cannot be null
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
        apiKey: apiKey,
        context: context); // Pass the valid BuildContext here instead of null
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
    bool closeConfirmed = false;
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
        return WillPopScope(
          child: Container(
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
                    return Center(
                        child: SpinKitDoubleBounce(
                      color: Colors.red,
                    )
                        // CircularProgressIndicator()
                        );
                  }
                  if (snapshot.hasError) {
                    throw snapshot.error!;
                  }
                  return PayUi(
                    url: snapshot.data!.hostedUrl!,
                  );
                }),
          ),
          // Container(
          //   clipBehavior: Clip.hardEdge,
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(20),
          //       topRight: Radius.circular(20),
          //     ),
          //   ),
          //   height: MediaQuery.of(context).size.height * 0.9,
          //   child:
          //   Column(
          //     children: [
          //       Expanded(
          //         child: FutureBuilder<HundredPayResponseModel>(
          //           future: s,
          //           builder: (context, snapshot) {
          //             if (!snapshot.hasData) {
          //               return const Center(child: CircularProgressIndicator());
          //             }
          //             if (snapshot.hasError) {
          //               throw snapshot.error!;
          //             }
          //             return PayUi(
          //               url: snapshot.data!.hostedUrl!,
          //             );
          //           },
          //         ),
          //       ),
          //       // if (!closeConfirmed) // Show the close button only if the user hasn't confirmed closing
          //       //   SizedBox(
          //       //     height: 50, // Adjust as needed
          //       //     child: ElevatedButton(
          //       //       onPressed: () {
          //       //         // Trigger the dialog when the user taps the close button
          //       //         showDialog(
          //       //           context: context,
          //       //           builder: (BuildContext context) {
          //       //             return AlertDialog(
          //       //               title: Text('Quit Payment'),
          //       //               content: Text(
          //       //                   'Do you want to quit the payment process?'),
          //       //               actions: [
          //       //                 TextButton(
          //       //                   onPressed: () {
          //       //                     Navigator.of(context)
          //       //                         .pop(); // Close the dialog
          //       //                   },
          //       //                   child: Text('Cancel'),
          //       //                 ),
          //       //                 TextButton(
          //       //                   onPressed: () {
          //       //                     closeConfirmed = true;
          //       //                     Navigator.of(context)
          //       //                         .pop(); // Close the dialog and bottom sheet
          //       //                   },
          //       //                   child: Text('Quit'),
          //       //                 ),
          //       //               ],
          //       //             );
          //       //           },
          //       //         );
          //       //       },
          //       //       child: Text('Close'),
          //       //     ),
          //       //   ),
          //     ],
          //   ),

          // ),

          onWillPop: () async {
            bool quit = await showDialog(
              context: context,
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
                      backgroundColor: Colors.white,
                      title: Text('Quit Payment'),
                      content: Text('Do you want to quit the payment process?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(false); // Stay on the bottom sheet
                          },
                          child: Text('Stay'),
                        ),
                        TextButton(
                          onPressed: () {
                            closeConfirmed = true;
                            Navigator.of(context)
                                .pop(true); // Allow dismissing the bottom sheet
                          },
                          child: Text(
                            'Quit',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
            return quit ?? false;
          },
        );
      },
    );
  }
}

// Container(
//           clipBehavior: Clip.hardEdge,
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               )),
//           height: MediaQuery.of(context).size.height * 0.9,
//           child: FutureBuilder<HundredPayResponseModel>(
//               future: s,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   throw snapshot.error!;
//                 }
//                 return PayUi(
//                   url: snapshot.data!.hostedUrl!,
//                 );
//               }),
//         );
