// // // // // import 'dart:developer';
// // // // // import 'dart:io';

// // // // // import 'package:flutter/foundation.dart';
// // // // // import 'package:pay100_pos/exports/export.dart';
// // // // // import 'package:pay100_pos/src/pay_ui.dart';
// // // // import 'dart:io';

// // // // import 'package:flutter/foundation.dart';
// // // // import 'package:pay100_pos/exports/export.dart';
// // // // import 'package:qr_code_scanner/qr_code_scanner.dart';

// // // // // // class QRScannerScreen extends StatefulWidget {
// // // // // //   @override
// // // // // //   _QRScannerScreenState createState() => _QRScannerScreenState();
// // // // // // }

// // // // // // class _QRScannerScreenState extends State<QRScannerScreen> {
// // // // // //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

// // // // // //   QRViewController? controller;

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: Text('QR Code Scanner'),
// // // // // //       ),
// // // // // //       body: Column(
// // // // // //         children: <Widget>[
// // // // // //           Expanded(
// // // // // //             flex: 4,
// // // // // //             child: QRView(
// // // // // //               key: qrKey,
// // // // // //               onQRViewCreated: _onQRViewCreated,
// // // // // //             ),
// // // // // //           ),
// // // // // //           Expanded(
// // // // // //             flex: 1,
// // // // // //             child: Center(
// // // // // //               child: ElevatedButton(
// // // // // //                 onPressed: () {
// // // // // //                   // You can add additional logic here if needed
// // // // // //                 },
// // // // // //                 child: Text('Scan QR Code'),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   void _onQRViewCreated(QRViewController controller) {
// // // // // //     this.controller = controller;
// // // // // //     controller.scannedDataStream.listen((scanData) {
// // // // // //       // Handle the scanned QR code data
// // // // // //       _openUrl(scanData.code);
// // // // // //     });
// // // // // //   }

// // // // // //   void _openUrl(String url) {
// // // // // //     // Navigate to a web view with the scanned URL
// // // // // //     Navigator.push(
// // // // // //       context,
// // // // // //       MaterialPageRoute(
// // // // // //         builder: (context) => PayUi(url: url),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     controller?.dispose();
// // // // // //     super.dispose();
// // // // // //   }
// // // // // // }

// // // // // class QRViewExample extends StatefulWidget {
// // // // //   const QRViewExample({Key? key}) : super(key: key);

// // // // //   @override
// // // // //   State<StatefulWidget> createState() => _QRViewExampleState();
// // // // // }

// // // // // class _QRViewExampleState extends State<QRViewExample> {
// // // // //   Barcode? result;
// // // // //   QRViewController? controller;
// // // // //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

// // // // //   // In order to get hot reload to work we need to pause the camera if the platform
// // // // //   // is android, or resume the camera if the platform is iOS.
// // // // //   @override
// // // // //   void reassemble() {
// // // // //     super.reassemble();
// // // // //     if (Platform.isAndroid) {
// // // // //       controller!.pauseCamera();
// // // // //     }
// // // // //     controller!.resumeCamera();
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: Column(
// // // // //         children: <Widget>[
// // // // //           Expanded(flex: 4, child: _buildQrView(context)),
// // // // //           Expanded(
// // // // //             flex: 1,
// // // // //             child: FittedBox(
// // // // //               fit: BoxFit.contain,
// // // // //               child: Column(
// // // // //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // //                 children: <Widget>[
// // // // //                   if (result != null)
// // // // //                     Text(
// // // // //                         'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
// // // // //                   else
// // // // //                     const Text('Scan a code'),
// // // // //                   Row(
// // // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // // // //                     children: <Widget>[
// // // // //                       Container(
// // // // //                         margin: const EdgeInsets.all(8),
// // // // //                         child: ElevatedButton(
// // // // //                             onPressed: () async {
// // // // //                               await controller?.toggleFlash();
// // // // //                               setState(() {});
// // // // //                             },
// // // // //                             child: FutureBuilder(
// // // // //                               future: controller?.getFlashStatus(),
// // // // //                               builder: (context, snapshot) {
// // // // //                                 return Text('Flash: ${snapshot.data}');
// // // // //                               },
// // // // //                             )),
// // // // //                       ),
// // // // //                       Container(
// // // // //                         margin: const EdgeInsets.all(8),
// // // // //                         child: ElevatedButton(
// // // // //                             onPressed: () async {
// // // // //                               await controller?.flipCamera();
// // // // //                               setState(() {});
// // // // //                             },
// // // // //                             child: FutureBuilder(
// // // // //                               future: controller?.getCameraInfo(),
// // // // //                               builder: (context, snapshot) {
// // // // //                                 if (snapshot.data != null) {
// // // // //                                   return Text(
// // // // //                                       'Camera facing ${describeEnum(snapshot.data!)}');
// // // // //                                 } else {
// // // // //                                   return const Text('loading');
// // // // //                                 }
// // // // //                               },
// // // // //                             )),
// // // // //                       )
// // // // //                     ],
// // // // //                   ),
// // // // //                   Row(
// // // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // // // //                     children: <Widget>[
// // // // //                       Container(
// // // // //                         margin: const EdgeInsets.all(8),
// // // // //                         child: ElevatedButton(
// // // // //                           onPressed: () async {
// // // // //                             await controller?.pauseCamera();
// // // // //                           },
// // // // //                           child: const Text('pause',
// // // // //                               style: TextStyle(fontSize: 20)),
// // // // //                         ),
// // // // //                       ),
// // // // //                       Container(
// // // // //                         margin: const EdgeInsets.all(8),
// // // // //                         child: ElevatedButton(
// // // // //                           onPressed: () async {
// // // // //                             await controller?.resumeCamera();
// // // // //                           },
// // // // //                           child: const Text('resume',
// // // // //                               style: TextStyle(fontSize: 20)),
// // // // //                         ),
// // // // //                       )
// // // // //                     ],
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           )
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildQrView(BuildContext context) {
// // // // //     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
// // // // //     var scanArea = (MediaQuery.of(context).size.width < 400 ||
// // // // //             MediaQuery.of(context).size.height < 400)
// // // // //         ? 150.0
// // // // //         : 300.0;
// // // // //     // To ensure the Scanner view is properly sizes after rotation
// // // // //     // we need to listen for Flutter SizeChanged notification and update controller
// // // // //     return QRView(
// // // // //       key: qrKey,
// // // // //       onQRViewCreated: _onQRViewCreated,
// // // // //       overlay: QrScannerOverlayShape(
// // // // //           borderColor: Colors.red,
// // // // //           borderRadius: 10,
// // // // //           borderLength: 30,
// // // // //           borderWidth: 10,
// // // // //           cutOutSize: scanArea),
// // // // //       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
// // // // //     );
// // // // //   }

// // // // //   void _onQRViewCreated(QRViewController controller) {
// // // // //     setState(() {
// // // // //       this.controller = controller;
// // // // //     });
// // // // //     controller.scannedDataStream.listen((scanData) {
// // // // //       setState(() {
// // // // //         result = scanData;
// // // // //       });
// // // // //     });
// // // // //   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     controller?.dispose();
// // // // //     super.dispose();
// // // // //   }
// // // // // }

// // // // class QRViewExample extends StatefulWidget {
// // // //   const QRViewExample({Key? key}) : super(key: key);

// // // //   @override
// // // //   State<StatefulWidget> createState() => _QRViewExampleState();
// // // // }

// // // // class _QRViewExampleState extends State<QRViewExample> {
// // // //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// // // //   Barcode? result;
// // // //   QRViewController? controller;

// // // //   // In order to get hot reload to work we need to pause the camera if the platform
// // // //   // is android, or resume the camera if the platform is iOS.
// // // //   @override
// // // //   void reassemble() {
// // // //     super.reassemble();
// // // //     if (Platform.isAndroid) {
// // // //       controller!.pauseCamera();
// // // //     } else if (Platform.isIOS) {
// // // //       controller!.resumeCamera();
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Column(
// // // //         children: <Widget>[
// // // //           Expanded(
// // // //             flex: 5,
// // // //             child: QRView(
// // // //               key: qrKey,
// // // //               onQRViewCreated: _onQRViewCreated,
// // // //             ),
// // // //           ),
// // // //           Expanded(
// // // //             flex: 1,
// // // //             child: Center(
// // // //               child: (result != null)
// // // //                   ? Text(
// // // //                       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
// // // //                   : Text('Scan a code'),
// // // //             ),
// // // //           )
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   void _onQRViewCreated(QRViewController controller) {
// // // //     this.controller = controller;
// // // //     controller.scannedDataStream.listen((scanData) {
// // // //       setState(() {
// // // //         result = scanData;
// // // //       });
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     controller?.dispose();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // import 'dart:io';

// // // import 'package:flutter/foundation.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:pay100_pos/exports/export.dart';
// // // import 'package:qr_code_scanner/qr_code_scanner.dart';
// // // import 'package:url_launcher/url_launcher.dart';

// // // class QRViewExample extends StatefulWidget {
// // //   const QRViewExample({Key? key}) : super(key: key);

// // //   @override
// // //   State<StatefulWidget> createState() => _QRViewExampleState();
// // // }

// // // class _QRViewExampleState extends State<QRViewExample> {
// // // late QRViewController controller;
// // // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// // // Barcode? result;
// // // bool isFlipped = false;
// // // bool isFlashOn = false;

// // // @override
// // // void reassemble() {
// // //   super.reassemble();
// // //   if (Platform.isAndroid) {
// // //     controller.pauseCamera();
// // //   } else if (Platform.isIOS) {
// // //     controller.resumeCamera();
// // //   }
// // // }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // // appBar: AppBar(
// // //   leading: GestureDetector(
// // //     onTap: () {
// // //       Navigator.pop(context);
// // //     },
// // //     child: ImageIcon(
// // //       AssetImage('assets/images/nav.png'),
// // //     ),
// // //   ),
// // actions: [
// //   IconButton(
// //     onPressed: () => _toggleCamera(),
// //     icon: Icon(Icons.flip_camera_ios),
// //   ),
// // ],
// // //   title: Row(
// // //     children: [
// // //       ImageIcon(
// // //         AssetImage('assets/images/scan.png'),
// // //       ),
// // //       ImageIcon(
// // //         AssetImage('assets/images/vert.png'),
// // //       ),
// // //       Text(
// // //         'Scan QR Code',
// // //         style: TextStyle(
// // //           fontFamily: 'space_grotesk',
// // //           fontSize: 18,
// // //           fontWeight: FontWeight.w700,
// // //         ),
// // //       )
// // //     ],
// // //   ),
// // // ),
// // //       body: SafeArea(
// // //         child: Column(
// // //           children: <Widget>[
// // // Padding(
// // //   padding:
// // //       const EdgeInsets.symmetric(horizontal: 52.5, vertical: 22),
// // //   child: Column(
// // //     children: [
// // //       Text('Scan Code to Pay',
// // //           style: TextStyle(
// // //               fontFamily: 'space_grotesk',
// // //               fontSize: 24,
// // //               fontWeight: FontWeight.w700)),
// // //       Padding(
// // //         padding: const EdgeInsets.symmetric(
// // //             horizontal: 10, vertical: 10),
// // child: Text(
// //     'Point the camera to the QR code or load picture with the QR code from your gallery to continue.',
// //     textAlign: TextAlign.center,
// //     style: TextStyle(
// //         fontFamily: 'space_grotesk',
// //         fontSize: 12,
// //         fontWeight: FontWeight.w500)),
// // //       ),
// // //     ],
// // //   ),
// // // ),
// // //             Expanded(
// // //               flex: 5,
// // //               child: QRView(
// // //                 key: qrKey,
// // //                 onQRViewCreated: _onQRViewCreated,
// // //               ),
// // //             ),
// // //             Expanded(
// // //               flex: 1,
// // //               child: Center(
// // //                 child: (result != null)
// // //                     ? Text(
// // //                         'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
// // //                     : Text('Scan a code'),
// // //               ),
// // //             ),
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //               children: <Widget>[
// //                 GestureDetector(
// //                   onTap: () {
// //                     setState(() {
// //                       isFlashOn = !isFlashOn;
// //                     });
// //                   },
// //                   child: CircleAvatar(
// //                     backgroundColor: Colors.grey.shade800,
// //                     child: ImageIcon(
// //                       AssetImage('assets/images/lamp-charge.png'),
// //                       color: isFlashOn ? Colors.yellow : Colors.grey.shade100,
// //                     ),
// //                   ),
// //                 ),
// // //                 // IconButton(
// // //                 //   onPressed: () => _toggleFlash(),
// // //                 //   icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
// // //                 // ),
// // //                 // ElevatedButton(
// // //                 //   onPressed: () {
// // //                 //     if (result != null) {
// // //                 //       _launchURL(result!.code);
// // //                 //     }
// // //                 //   },
// // //                 //   child: Text('Open URL'),
// // //                 // ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // // void _onQRViewCreated(QRViewController controller) {
// // //   this.controller = controller;
// // //   controller.scannedDataStream.listen((scanData) {
// // //     setState(() {
// // //       result = scanData;
// // //     });
// // //   });
// // // }

// // void _toggleCamera() {
// //   controller.flipCamera();
// //   setState(() {
// //     isFlipped = !isFlipped;
// //   });
// // }

// // // void _toggleFlash() {
// // //   controller.toggleFlash();
// // //   setState(() {
// // //     isFlashOn = !isFlashOn;
// // //   });
// // // }

// // //   void _launchURL(String url) async {
// // //     if (await canLaunch(url)) {
// // //       await launch(url);
// // //     } else {
// // //       throw 'Could not launch $url';
// // //     }
// // //   }

// // //   @override
// // //   void dispose() {
// // //     controller.dispose();
// // //     super.dispose();
// // //   }
// // // }

// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class QRViewExample extends StatefulWidget {
// //   const QRViewExample({Key? key}) : super(key: key);

// //   @override
// //   State<StatefulWidget> createState() => _QRViewExampleState();
// // }

// // class _QRViewExampleState extends State<QRViewExample> {
// //   late QRViewController controller;
// //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// //   bool isFlashOn = false;

// //   @override
// //   void reassemble() {
// //     super.reassemble();
// //     if (Platform.isAndroid) {
// //       controller.pauseCamera();
// //     } else if (Platform.isIOS) {
// //       controller.resumeCamera();
// //     }
// //   }

// //   // late QRViewController controller;
// //   // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// //   Barcode? result;
// //   bool isFlipped = false;
// //   // bool isFlashOn = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.black.withOpacity(0.5),
// //         leading: GestureDetector(
// //           onTap: () {
// //             Navigator.pop(context);
// //           },
// //           child: ImageIcon(
// //             AssetImage('assets/images/nav.png'),
// //           ),
// //         ),
// //         actions: [
// //           IconButton(
// //             onPressed: () => _toggleCamera(),
// //             icon: Icon(Icons.flip_camera_ios),
// //           ),
// //         ],
// //         title: Row(
// //           children: [
// //             ImageIcon(
// //               AssetImage('assets/images/scan.png'),
// //             ),
// //             ImageIcon(
// //               AssetImage('assets/images/vert.png'),
// //             ),
// //             Text(
// //               'Scan QR Code',
// //               style: TextStyle(
// //                 fontFamily: 'space_grotesk',
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.w700,
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //       body: Stack(
// //         children: [
// //           QRView(
// //             key: qrKey,
// //             onQRViewCreated: _onQRViewCreated,
// //           ),
// //           Positioned.fill(
// //             child: Container(
// //               color: Colors.black.withOpacity(0.5), // Darken the screen
// //               child: Center(
// //                 child: SizedBox(
// //                   width: 200, // Adjust the size as needed
// //                   height: 200, // Adjust the size as needed
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       border: Border.all(color: Colors.white, width: 2),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _toggleFlash,
// //         child: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
// //       ),
// //     );
// //   }

// //   void _onQRViewCreated(QRViewController controller) {
// //     this.controller = controller;
// //     controller.scannedDataStream.listen((scanData) {
// //       _launchURL(scanData.code); // Automatically launch URL
// //     });
// //   }

// //   void _toggleFlash() {
// //     controller.toggleFlash();
// //     setState(() {
// //       isFlashOn = !isFlashOn;
// //     });
// //   }

// //   void _toggleCamera() {
// //     controller.flipCamera();
// //     setState(() {
// //       isFlipped = !isFlipped;
// //     });
// //   }

// //   // void _onQRViewCreated(QRViewController controller) {
// //   //   this.controller = controller;
// //   //   controller.scannedDataStream.listen((scanData) {
// //   //     setState(() {
// //   //       result = scanData;
// //   //     });
// //   //   });
// //   // }

// //   void _launchURL(String url) async {
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }
// // }

// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:pay100_pos/exports/export.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:url_launcher/url_launcher.dart';

// class QRViewExample extends StatefulWidget {
//   const QRViewExample({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   late QRViewController controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   bool isFlashOn = false;
//   bool isFlipped = false;
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: ImageIcon(
//             AssetImage('assets/images/nav.png'),
//           ),
//         ),
//         // actions: [
//         //   IconButton(
//         //     onPressed: () => _toggleFlash(),
//         //     icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
//         //   ),
//         // ],

//         actions: [
//           IconButton(
//             onPressed: () => _toggleCamera(),
//             icon: Icon(Icons.flip_camera_ios),
//           ),
//         ],
//         title: Row(
//           children: [
//             ImageIcon(
//               AssetImage('assets/images/scan.png'),
//             ),
//             ImageIcon(
//               AssetImage('assets/images/vert.png'),
//             ),
//             Text(
//               'Scan QR Code',
//               style: TextStyle(
//                 fontFamily: 'space_grotesk',
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//               ),
//             )
//           ],
//         ),
//       ),
//       backgroundColor: Colors.transparent,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 52.5, vertical: 22),
//               child: Column(
//                 children: [
//                   Text('Scan Code to Pay',
//                       style: TextStyle(
//                           fontFamily: 'space_grotesk',
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700)),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: Text(
//                         'Point the camera to the QR code or load picture with the QR code from your gallery to continue.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontFamily: 'space_grotesk',
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500)),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Stack(
//                 children: [
//                   QRView(
//                     key: qrKey,
//                     onQRViewCreated: _onQRViewCreated,
//                   ),
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color:
//                               result != null ? Colors.red : Colors.transparent,
//                           width: 4.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Center(
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           height: MediaQuery.of(context).size.width * 0.8,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.white, width: 2),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isFlashOn = !isFlashOn;
//                     });
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: Colors.grey.shade800,
//                     child: ImageIcon(
//                       AssetImage('assets/images/lamp-charge.png'),
//                       color: isFlashOn ? Colors.yellow : Colors.grey.shade100,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _toggleFlash() {
//     controller.toggleFlash();
//     setState(() {
//       isFlashOn = !isFlashOn;
//     });
//   }

//   void _toggleCamera() {
//     controller.flipCamera();
//     setState(() {
//       isFlipped = !isFlipped;
//     });
//   }

//   // void _onQRViewCreated(QRViewController controller) {
//   //   this.controller = controller;
//   //   controller.scannedDataStream.listen((scanData) {
//   //     setState(() {
//   //       result = scanData;
//   //     });
//   //     if (result != null) {
//   //       // Do something with the scanned result, like open the URL
//   //       _launchURL(result!.code);
//   //     }
//   //   });
//   // }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//       if (result != null) {
//         _launchURL(
//             result!.code); // Navigate to URL only when QR code is scanned
//       }
//     });
//   }

//   // void _toggleFlash() {
//   //   controller.toggleFlash();
//   //   setState(() {
//   //     isFlashOn = !isFlashOn;
//   //   });
//   // }

//   // void _launchURL(String url) async {
//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }

//   void _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       if (!Navigator.canPop(context)) {
//         // Check if URL page is not already open
//         await launch(url);
//       }
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// // class _QRViewExampleState extends State<QRViewExample> {
// //   late QRViewController controller;
// //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// //   bool isFlashOn = false;
// // // late QRViewController controller;
// //   // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// //   Barcode? result; // Define the result variable here
// //   // bool isFlashOn = false;
// //   @override
// //   void reassemble() {
// //     super.reassemble();
// //     if (Platform.isAndroid) {
// //       controller.pauseCamera();
// //     } else if (Platform.isIOS) {
// //       controller.resumeCamera();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: GestureDetector(
// //           onTap: () {
// //             Navigator.pop(context);
// //           },
// //           child: ImageIcon(
// //             AssetImage('assets/images/nav.png'),
// //           ),
// //         ),
// //         actions: [
// //           IconButton(
// //             onPressed: () => _toggleFlash(),
// //             icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
// //           ),
// //         ],
// //         title: Row(
// //           children: [
// //             ImageIcon(
// //               AssetImage('assets/images/scan.png'),
// //             ),
// //             ImageIcon(
// //               AssetImage('assets/images/vert.png'),
// //             ),
// //             Text(
// //               'Scan QR Code',
// //               style: TextStyle(
// //                 fontFamily: 'space_grotesk',
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.w700,
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //       body: SafeArea(
// //         child: Column(
// //           children: <Widget>[
// //             Padding(
// //               padding:
// //                   const EdgeInsets.symmetric(horizontal: 52.5, vertical: 22),
// //               child: Column(
// //                 children: [
// //                   Text('Scan Code to Pay',
// //                       style: TextStyle(
// //                           fontFamily: 'space_grotesk',
// //                           fontSize: 24,
// //                           fontWeight: FontWeight.w700)),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 10, vertical: 10),
// //                     child: Text(
// //                         'Point the camera to the QR code or load picture with the QR code from your gallery to continue.',
// //                         textAlign: TextAlign.center,
// //                         style: TextStyle(
// //                             fontFamily: 'space_grotesk',
// //                             fontSize: 12,
// //                             fontWeight: FontWeight.w500)),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Expanded(
// //               flex: 5,
// //               child: Stack(
// //                 children: [
// //                   QRView(
// //                     key: qrKey,
// //                     onQRViewCreated: _onQRViewCreated,
// //                   ),
// //                   Positioned.fill(
// //                     child: Container(
// //                       color: Colors.black.withOpacity(0.5), // Darken the screen
// //                       child: Center(
// //                         child: SizedBox(
// //                           width: 200, // Adjust the size as needed
// //                           height: 200, // Adjust the size as needed
// //                           child: Container(
// //                             decoration: BoxDecoration(
// //                               border: Border.all(color: Colors.white, width: 2),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Expanded(
// //               flex: 1,
// //               child: Center(
// //                 child: (result != null)
// //                     ? Text(
// //                         'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
// //                     : Text('Scan a code'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _onQRViewCreated(QRViewController controller) {
// //     this.controller = controller;
// //     controller.scannedDataStream.listen((scanData) {
// //       _launchURL(scanData.code); // Automatically launch URL
// //     });
// //   }

// //   void _toggleFlash() {
// //     controller.toggleFlash();
// //     setState(() {
// //       isFlashOn = !isFlashOn;
// //     });
// //   }

// //   void _launchURL(String url) async {
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }
// // }

import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast library
import 'package:pay100_pos/exports/export.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  bool isFlashOn = false;
  bool isFlipped = false;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: ImageIcon(
            AssetImage('assets/images/nav.png'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _toggleCamera(),
            icon: Icon(Icons.flip_camera_ios),
          ),
        ],
        title: Row(
          children: [
            ImageIcon(
              AssetImage('assets/images/scan.png'),
            ),
            ImageIcon(
              AssetImage('assets/images/vert.png'),
            ),
            Text(
              'Scan QR Code',
              style: TextStyle(
                fontFamily: 'space_grotesk',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.5, vertical: 22),
              child: Column(
                children: [
                  Text(
                    'Scan Code to Pay',
                    style: TextStyle(
                      fontFamily: 'space_grotesk',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      'Point the camera to the QR code or load a picture with the QR code from your gallery to continue.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'space_grotesk',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              result != null ? Colors.red : Colors.transparent,
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.8,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFlashOn = !isFlashOn;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        isFlashOn ? Colors.white : Colors.grey.shade800,
                    child: ImageIcon(
                      AssetImage('assets/images/lamp-charge.png'),
                      color: isFlashOn ? Colors.pink : Colors.grey.shade100,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _toggleCamera() {
    controller.flipCamera();
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if (result != null) {
        _handleScannedResult(result!.code!); // Handle scanned result
      }
    });
  }

  void _toggleFlash() async {
    await controller.toggleFlash();
    setState(() {
      isFlashOn = !isFlashOn;
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Handle scanned result
  void _handleScannedResult(String code) {
    // Show toast message
    Fluttertoast.showToast(
      msg: code,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Launch URL
    _launchURL(code);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
