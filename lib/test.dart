import 'package:flutter/material.dart';
import 'package:hundredpay/hundredpay.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:hundredpay/hundredpay.dart';

import 'api_call.dart';

class Pay100 extends StatefulWidget {
  const Pay100({super.key});

  @override
  State<Pay100> createState() => _Pay100State();
}

class _Pay100State extends State<Pay100> {
  // String titleur?;
  bool isLoading = false;
  // final _key = UniqueKey();
  String displayedExpression = "";
  var controller = WebViewController();

  @override
  void initState() {
    super.initState();
  }

  void _showWebviewModal(String url) {
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
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
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
          child: WebViewWidget(
            controller: controller,
          ),
        );
      },
    );
  }

  String formatNumber(String s) {
    if (s.isEmpty) return "";
    return NumberFormat("#,###")
        .format(int.tryParse(s.replaceAll(",", "")) ?? 0);
  }

  Widget buildCalculatorButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        children: [
          TableRow(
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
            ],
          ),
          TableRow(
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
            ],
          ),
          TableRow(
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
            ],
          ),
          TableRow(
            children: [
              const Text(''),
              buildButton('0'),
              buildButton('Del'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(243, 244, 246, 1),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24)),
        onPressed: () => onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        displayedExpression = "";
      } else if (buttonText == 'Del') {
        if (displayedExpression.isNotEmpty) {
          displayedExpression = formatNumber(
              displayedExpression.substring(0, displayedExpression.length - 1));
        }
      } else {
        displayedExpression = formatNumber(displayedExpression + buttonText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            
            children: [
              DrawerHeader(child: Column(
                children: [
                  Image.asset(
                      "assets/images/100pay.png",
                      width: 100,
                    ),
                ],
              )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   ListTile(
                    
                    onTap: () {
                      
                    },
                    title: Text("Logout"),
                    leading: Icon(Icons.logout),
                   )
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.settings,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
  ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                // padding: const EdgeInsets.only(top: 8.0),
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Image.asset(
                      "assets/images/100pay.png",
                      width: 100,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '₦ ', // Naira symbol
                              style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: displayedExpression,
                              style: const TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: buildCalculatorButtons(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          HundredPay.makePayment(
                            customerEmail: 'gideongabriel557@gmail.com',
                            customerPhoneNumber: '08121154848',
                            customerName: 'Gideon',
                            userId: "6143bfb7fe85e0020bf243f9",
                            chargeSource: "api",
                            currency: "NGN",
                            country: "NG",
                            callBackUrl: "https://api.100pay.co/api/v1/pay/crypto/payment/6143bfb7fe85e0020bf243f9",
                            customerUserId: '234',
                            refId: "012232",
                            amount: displayedExpression.replaceAll(',', ''),
                            description: 'my test api',
                            apiKey:
                                'LIVE;PK;eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6IjY1OTlhNGY0NTU2MDMyMDAyYjJiNTFjZSIsInVzZXJJZCI6IjY1OTlhNGY0NTU2MDMyMDAyYjJiNTFjOSIsImlhdCI6MTcwNDU2ODA1Mn0.s4Cb2vUgyTeYhseZtMkqAlt8TE4nu2an_PTOA8ZSlwE',
                            metadata: {"is_approved": "yes"},
                            context: context,
                            onClosed: () {},
                            onSuccess: () {},
                          );
                          //  setState(() {
                          //     isLoading = true;
                          //  });
                          //   AppiCall.makePayment(amount: displayedExpression)
                          //       .then((value) {
                          //     setState(() {
                          //       isLoading = false;
                          //     });
                          //     _showWebviewModal(value.hostedUrl!);
                          //   }).onError((error, stackTrace) {
                          //     setState(() {
                          //       isLoading = false;
                          //     });
                          //   });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.red,
                        ), // Call the API when the button is pressed
                        child: const Text(
                          "Proceed",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
