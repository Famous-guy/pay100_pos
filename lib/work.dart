import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'api_call.dart';

class pay100 extends StatefulWidget {
  @override
  _pay100State createState() => _pay100State();
}

class _pay100State extends State<pay100> {
  String displayedExpression = "";

  // void _showWebviewModal(String url) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext bc) {
  //       return SizedBox(
  //         height: MediaQuery.of(context).size.height * 0.9,
  //         child: WebView(
  //           initialUrl: url,
  //           javascriptMode: JavascriptMode.unrestricted,
  //           navigationDelegate: (NavigationRequest request) {
  //             if (request.url.startsWith(url)) {
  //               return NavigationDecision.navigate;
  //             } else {
  //               launchURL(request.url);
  //               return NavigationDecision.prevent;
  //             }
  //           },
  //           onWebResourceError: (WebResourceError error) {
  //             print("Webview error: ${error.description}");
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
  // Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 15),
  //   child: SizedBox(
  //     height: 80,
  //     child: Card(
  //       elevation: 0,
  //       color: Color.fromRGBO(153, 172, 241, 0.11),
  //       child: Center(
  //         child: ListTile(
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => Account(),
  //                 ));
  //           },
  //           splashColor: Color.fromRGBO(153, 172, 241, 0.11),
  //           leading: Icon(Icons.account_circle,
  //               color: _isDarkMode
  //                   ? Colors.white
  //                   : Colors
  //                       .black), // Change font color based on _isDarkMode
  //           title: Text("My Account Profile",
  //               style: TextStyle(
  //                   color: _isDarkMode
  //                       ? Colors.white
  //                       : Colors
  //                           .black)), // Change font color based on _isDarkMode
  //           trailing: Icon(Icons.arrow_forward_ios_outlined,
  //               color: _isDarkMode
  //                   ? Colors.white
  //                   : Colors
  //                       .black), // Change font color based on _isDarkMode
  //         ),
  //       ),
  //     ),
  //   ),
  // ),
  // Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 15),
  //   child: SizedBox(
  //     height: 80,
  //     child: Card(
  //       elevation: 0,
  //       color: Color.fromRGBO(153, 172, 241, 0.11),
  //       child: Center(
  //         child: ListTile(
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => MySettingsPage(),
  //                 ));
  //           },
  //           splashColor: Color.fromRGBO(153, 172, 241, 0.11),
  //           leading: Icon(Icons.settings,
  //               color: _isDarkMode
  //                   ? Colors.white
  //                   : Colors
  //                       .black), // Change font color based on _isDarkMode
  //           title: Text("Settings",
  //               style: TextStyle(
  //                   color: _isDarkMode
  //                       ? Colors.white
  //                       : Colors
  //                           .black)), // Change font color based on _isDarkMode
  //           trailing: Icon(Icons.arrow_forward_ios_outlined,
  //               color: _isDarkMode
  //                   ? Colors.white
  //                   : Colors
  //                       .black), // Change font color based on _isDarkMode
  //         ),
  //       ),
  //     ),
  //   ),
  // ),

  // Divider(
  //   color: Colors.transparent,
  //   height: 10,
  // ),

   //  Drawer(
            //   child: Column(
            //     children: [
            //       // DrawerHeader(
            //       //   child: Image.asset(
            //       //     "assets/images/100pay.png",
            //       //     width: 100,
            //       //   ),
            //       // ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         // rgba(153, 172, 241, 0.11)
            //         children: [
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Image.asset(
            //                 "assets/images/100pay.png",
            //                 width: 100,
            //               ),
            //               SizedBox(
            //                 height: 40,
            //                 width: 120,
            //                 child: DefaultTextStyle.merge(
            //                   style: const TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 18.0,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                   child: GestureDetector(
            //                     onTap: () {
            //                       setState(() {
            //                         _isDarkMode = !_isDarkMode; // Toggle dark mode
            //                       });
            //                     },
            //                     child: IconTheme.merge(
            //                       data: IconThemeData(color: Colors.black),
            //                       child: _isDarkMode
            //                           ? Icon(Icons.brightness_5,
            //                               color: Colors.white,
            //                               size:
            //                                   30.0) // Brightness icon for dark mode
            //                           : Icon(Icons.nightlight_round,
            //                               color: Colors
            //                                   .grey.shade600, // Changed to black
            //                               size: 30.0), // Moon icon for light mode
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Divider(),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 15),
            //             child: SizedBox(
            //               height: 80,
            //               child: Card(
            //                 elevation: 0,
            //                 color: Color.fromRGBO(153, 172, 241, 0.11),
            //                 child: Center(
            //                   child: ListTile(
            //                     onTap: () {
            //                       Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                             builder: (context) => Account(),
            //                           ));
            //                     },
            //                     // focusColor: Colors.amber,
            //                     splashColor: Color.fromRGBO(153, 172, 241, 0.11),

            //                     leading: Icon(Icons.account_circle,
            //                         color: Colors.black), // Changed to black
            //                     title: Text("My Account Profile",
            //                         style: TextStyle(
            //                             color: Colors.black)), // Changed to black
            //                     trailing: Icon(Icons.arrow_forward_ios_outlined,
            //                         color: Colors.black), // Changed to black
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 15),
            //             // padding: const EdgeInsets.all(8.0),
            //             child: SizedBox(
            //               height: 80,
            //               child: Card(
            //                 elevation: 0,
            //                 color: Color.fromRGBO(153, 172, 241, 0.11),
            //                 child: Center(
            //                   child: ListTile(
            //                     onTap: () {
            //                       Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                             builder: (context) => MySettingsPage(),
            //                           ));
            //                     },
            //                     // focusColor: Colors.amber,
            //                     splashColor: Color.fromRGBO(153, 172, 241, 0.11),

            //                     leading: Icon(Icons.settings,
            //                         color: Colors.black), // Changed to black
            //                     title: Text("Settings",
            //                         style: TextStyle(
            //                             color: Colors.black)), // Changed to black
            //                     trailing: Icon(Icons.arrow_forward_ios_outlined,
            //                         color: Colors.black), // Changed to black
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Divider(
            //             color: Colors.transparent,
            //             height: 10,
            //           ),
            //         ],
            //       ),
            //       Expanded(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             Padding(
            //               // padding: const EdgeInsets.only(bottom: 20),
            //               padding: const EdgeInsets.symmetric(horizontal: 15),
            //               child: SizedBox(
            //                 height: 80,
            //                 child: Card(
            //                   elevation: 0,
            //                   color: Color.fromRGBO(153, 172, 241, 0.11),
            //                   child: Center(
            //                     child: ListTile(
            //                       onTap: () async {
            //                         await logSignInOrOut('Sign Out');
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                             builder: (context) => SignIn(),
            //                           ),
            //                         );
            //                       },
            //                       title: const Text("Logout",
            //                           style: TextStyle(
            //                               color: Colors.black)), // Changed to black
            //                       leading: const Icon(Icons.logout,
            //                           color: Colors.black), // Changed to black
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Divider(
            //               color: Colors.transparent,
            //               height: 20,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('1'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('2'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('3'),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('4'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('5'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('6'),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('7'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('8'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: buildButton('9'),
              ),
            ],
          ),
          TableRow(
            children: [
              Text(''),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: buildButton('0'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: buildButton('Del'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(1, 4, 54, 0.8),
            shape: CircleBorder(),
            padding: EdgeInsets.all(24)),
        onPressed: () => onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
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
                          TextSpan(
                            text: '₦ ', // Naira symbol
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: displayedExpression,
                            style: TextStyle(
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
          Divider(),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: buildCalculatorButtons(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AppiCall.makePayment().then((value) {
                    // _showWebviewModal('https://pay.100pay.co/pay/65ab782a25c0b2003e84d4fc');
                  });
                }, // Call the API when the button is pressed
                child: Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
