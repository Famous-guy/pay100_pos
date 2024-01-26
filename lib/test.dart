import 'package:flutter/material.dart';
import 'package:hundredpay/hundredpay.dart';
import 'package:intl/intl.dart';
import 'package:pay100_pos/onboarding_screen/signin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Pay100 extends StatefulWidget {
  final String apikey;
  final String emailAddress;
  final String userName;

  const Pay100(
      {Key? key,
      required this.apikey,
      required this.emailAddress,
      required this.userName})
      : super(key: key);

  @override
  State<Pay100> createState() => _Pay100State();
}

class _Pay100State extends State<Pay100> {
  final apiKe = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  bool isLoading = false;
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
          onProgress: (int progress) {},
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
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
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
          padding: const EdgeInsets.all(24),
        ),
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
            displayedExpression.substring(0, displayedExpression.length - 1),
          );
        }
      } else {
        displayedExpression = formatNumber(displayedExpression + buttonText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/100pay.png",
                      width: 100,
                    ),
                    Text(
                      "Welcome ${widget.userName}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Column(
                // rgba(153, 172, 241, 0.11)
                children: [
                  SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 0,
                      color: Color.fromRGBO(153, 172, 241, 0.11),
                      child: Center(
                        child: ListTile(
                          onTap: () {},
                          // focusColor: Colors.amber,
                          splashColor: Color.fromRGBO(153, 172, 241, 0.11),

                          leading: Icon(Icons.feedback,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                          title: Text("Edit profile"),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  // Text(data)
                  SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 0,
                      color: Color.fromRGBO(153, 172, 241, 0.11),
                      child: Center(
                        child: ListTile(
                          onTap: () {},
                          // focusColor: Colors.amber,
                          splashColor: Color.fromRGBO(153, 172, 241, 0.11),

                          leading: Icon(Icons.feedback,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                          title: Text("Support"),
                          // rgba(3, 41, 174, 1)
                          trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 0,
                      color: Color.fromRGBO(153, 172, 241, 0.11),
                      child: Center(
                        child: ListTile(
                          onTap: () {},
                          // focusColor: Colors.amber,
                          splashColor: Color.fromRGBO(153, 172, 241, 0.11),

                          leading: Icon(Icons.feedback,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                          title: Text("Notifications"),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  SizedBox(
                    height: 80,
                    child: Center(
                      child: Card(
                        elevation: 0,
                        color: Color.fromRGBO(153, 172, 241, 0.11),
                        child: ListTile(
                          onTap: () {},
                          // focusColor: Colors.amber,
                          splashColor: Color.fromRGBO(153, 172, 241, 0.11),

                          leading: Icon(Icons.feedback,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                          title: Text("Settings"),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 80,
                        child: Card(
                          elevation: 0,
                          color: Color.fromRGBO(153, 172, 241, 0.11),
                          child: Center(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ));
                              },
                              title: const Text("Logout"),
                              leading: const Icon(Icons.logout,
                                  color: Color.fromRGBO(3, 41, 174, 1)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: displayedExpression,
                              style: const TextStyle(
                                fontSize: 40.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
                          if (displayedExpression.isNotEmpty) {
                            HundredPay.makePayment(
                              customerEmail: widget.emailAddress,
                              customerPhoneNumber: '08121154848',
                              customerName: widget.userName,
                              customerUserId: '293391',
                              amount: displayedExpression.replaceAll(',', ''),
                              userId: '6143bfb7fe85e0020bf243f9',
                              refId: '012232',
                              description: 'MY POS',
                              apiKey: widget.apikey,
                              currency: 'NGN',
                              country: 'NG',
                              chargeSource: '10',
                              callBackUrl:
                                  'https://api.100pay.co/api/v1/pay/crypto/payment/6143bfb7fe85e0020bf243f9',
                              onError: (error) {},
                              context: context,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.red,
                        ),
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
