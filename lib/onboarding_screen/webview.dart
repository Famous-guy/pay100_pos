import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayUi extends StatefulWidget {
  final String url;
  const PayUi(
      {Key? key,
      required this.url,
      required Null Function(dynamic controller) onWebViewCreated})
      : super(key: key);

  @override
  State<PayUi> createState() => _PayUiState();
}

class _PayUiState extends State<PayUi> {
  var controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://streamlivr.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: MediaQuery.of(context).size.height * 0.9,
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
