// import 'package:connectivity/connectivity.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/route_manager.dart';
// import 'package:pay100_pos/exports/export.dart';

// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();

//   @override
//   void onInit() {
//     super.onInit();
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   void _updateConnectionStatus(ConnectivityResult connectivityResult) {
//     if (connectivityResult == ConnectivityResult.none) {
//       Get.rawSnackbar(
//         messageText: Text(
//           'PLEASE CONNECT TO THE INTERNET',
//           style: TextStyle(color: Colors.white, fontSize: 14),
//         ),
//         isDismissible: false,
//         duration: Duration(days: 1),
//         backgroundColor: Colors.red[400]!,
//         icon: Icon(
//           Icons.wifi_off,
//           color: Colors.white,
//           size: 35,
//         ),
//         margin: EdgeInsets.zero,
//         snackStyle: SnackStyle.FLOATING,
//       );
//     } else {
//       if (Get.isSnackbarOpen) {
//         Get.closeCurrentSnackbar();
//       }
//     }
//   }
// }
