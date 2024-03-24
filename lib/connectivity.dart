// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:pay100_pos/exports/export.dart';

// class ConnectivityService {
//   late StreamSubscription subscription;
//   var isDeviceConnected = false;
//   bool isAlertSet = false;

//   void initConnectivity(BuildContext context) {
//     subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) async {
//       isDeviceConnected = await InternetConnectionChecker().hasConnection;
//       if (!isDeviceConnected && !isAlertSet) {
//         _showDialogBox(context);
//         isAlertSet = true;
//       }
//     });
//   }

//   void dispose() {
//     subscription.cancel();
//   }

//   void _showDialogBox(BuildContext context) {
//     showCupertinoDialog<String>(
//       context: context,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: const Text('No Connection'),
//         content: const Text('Please check your internet connectivity'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(context, 'Cancel');
//               isAlertSet = false;
//               isDeviceConnected =
//                   await InternetConnectionChecker().hasConnection;
//               if (!isDeviceConnected && !isAlertSet) {
//                 _showDialogBox(context);
//                 isAlertSet = true;
//               }
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pay100_pos/exports/export.dart';

class ConnectivityService {
  static final ConnectivityService _singleton = ConnectivityService._internal();

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  factory ConnectivityService() {
    return _singleton;
  }

  ConnectivityService._internal();

  void initConnectivity(BuildContext context) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && !isAlertSet) {
        _showDialogBox(context);
        isAlertSet = true;
      }
    });
  }

  void dispose() {
    subscription.cancel();
  }

  void _showDialogBox(BuildContext context) {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No Connection'),
        content: const Text('Please check your internet connectivity'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              isAlertSet = false;
              isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected && !isAlertSet) {
                _showDialogBox(context);
                isAlertSet = true;
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
