// // import 'package:flutter/material.dart';

// // class payAccount extends StatefulWidget {
// //   const payAccount({super.key});

// //   @override
// //   State<payAccount> createState() => _payAccountState();
// // }

// // class _payAccountState extends State<payAccount> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:pay100_pos/onboarding_screen/webview.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_cookie_manager/webview_cookie_manager.dart';
// // import 'pay_ui.dart'; // Import the PayUi widget

// // void main() {
// //   runApp(MyApp());
// // }

// class Pay100Token extends StatefulWidget {
//   @override
//   State<Pay100Token> createState() => _Pay100TokenState();
// }

// class _Pay100TokenState extends State<Pay100Token> {
//   var controller = WebViewController();

//   @override
//   Widget build(BuildContext context) {
//     // final cookieManager = WebviewCookieManager();

//     // final cookieManager = WebviewCookieManager();
//     @override
//     void initState() async {
//       super.initState();
//       print('about to clear');
//       await controller.clearCache();
//       print('cleared');
//       await WebViewCookieManager()
//           .clearCookies(); // Clear cache when the widget is disposed
//       print('cleared');
//     }

//     @override
//     void dispose() async {
//       print('about to clear');
//       await controller.clearCache();
//       print('cleared');
//       await WebViewCookieManager()
//           .clearCookies(); // Clear cache when the widget is disposed
//       print('cleared');
//       super.dispose();
//     }

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () async {
//                 // final gotCookies = await cookieManager
//                 //     .getCookies('https://app.100pay.co/login');
//                 // for (var item in gotCookies) {
//                 //   print(item);
//                 // }
//                 await clearCacheAndCookies();
//                 await controller.clearCache();
//                 print('cleared');
//                 await WebViewCookieManager().clearCookies();
//                 print('cleared');
//                 Navigator.pop(context);

//                 // await cookieManager.clearCookies();
//               },
//               icon: Icon(Icons.close)),
//           title: Text('WebView Example'),
//         ),
//         body: Center(
//           child: PayUi(
//             url: 'https://app.100pay.co/login',
//             onWebViewCreated: (controller) {
//               JavaScriptMode.unrestricted;
//             },
//           ), // Provide the website URL here
//         ),
//       ),
//     );
//   }

//   Future<void> clearCacheAndCookies() async {
//     controller.clearCache();
//     await WebViewCookieManager().clearCookies();
//     print('cleared');
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pay100_pos/test.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Pay100Token extends StatefulWidget {
  @override
  State<Pay100Token> createState() => _Pay100TokenState();
}

class _Pay100TokenState extends State<Pay100Token> {
  late InAppWebViewController controller;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    _clearCacheAndCookies();
  }

  Future<void> _clearCacheAndCookies() async {
    await controller.clearCache();
    await WebViewCookieManager().clearCookies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          onPressed: () async {
            await _clearCacheAndCookies();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Pay100(),
                ));
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        title: Text('app.100pay.co'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: progress,
                  color: Colors.red,
                  backgroundColor: Colors.black12,
                ),
                Expanded(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse('https://app.100pay.co/login'),
                    ),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        javaScriptEnabled: true,
                      ),
                    ),
                    onProgressChanged: (controller, progress) {
                      setState(() => this.progress = progress / 100);
                    },
                    onWebViewCreated: (controller) {
                      this.controller = controller;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
