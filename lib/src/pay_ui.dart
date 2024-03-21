import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayUi extends StatefulWidget {
  final String url;
  const PayUi({Key? key, required this.url}) : super(key: key);

  @override
  State<PayUi> createState() => _PayUiState();
}

class _PayUiState extends State<PayUi> {
  late WebViewController controller;
  double progress = 0;
  @override
  void initState() async {
    print('about to clear');
    await controller.clearCache();
    print('cleared');
    await WebViewCookieManager()
        .clearCookies(); // Clear cache when the widget is disposed
    print('cleared');
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          // onProgress: (int progress) {

          //   // Update loading bar.
          // },

          onProgress: (progress) =>
              setState(() => this.progress = (progress / 100)),
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() async {
    print('about to clear');
    await controller.clearCache();
    print('cleared');
    await WebViewCookieManager()
        .clearCookies(); // Clear cache when the widget is disposed
    print('cleared');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9, // Set a fixed height
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.black12,
            ),
            Expanded(
              child: WebViewWidget(
                gestureRecognizers: {
                  Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
                  ),
                },
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
