import 'dart:async';
import 'dart:io';

// import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pay100_pos/connectivity.dart';
import 'package:pay100_pos/exports/export.dart';
import 'package:pay100_pos/src/pay_ui.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/connectposprovider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

bool _isDarkMode = false;

class _SignInState extends State<SignIn> {
  // late StreamSubscription subscription;
  // var isDeviceConnected = false;
  // bool isAlertSet = false;
  // getConnectivity() {
  //   subscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) async {
  //     isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //     if (!isDeviceConnected && isAlertSet == false) {
  //       showDialogBox();
  //       setState(() => isAlertSet = true);
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   // getConnectivity();
  //   // TODO: implement initState
  //   super.initState();
  //   getConnectivity();
  // }

  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }

  // showDialogBox() {
  //   if (Platform.isIOS) {
  //     showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && !isAlertSet) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && !isAlertSet) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && isAlertSet == false) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  final apiKeyController = TextEditingController();
  bool _isApiKeyValid = true;
  bool _isLoading = false;
  // final ConnectivityService connectivityService = ConnectivityService();

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    // Retrieve the current theme from the context
    final ThemeData theme = Theme.of(context);
    _isDarkMode = brightness == Brightness.dark;
    String imageAssetPath = _isDarkMode
        ? 'assets/images/100Paywhite.png'
        : 'assets/images/100Payblack.png';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Image.asset(
                    imageAssetPath,
                    // 'assets/images/100Pay${theme.brightness == Brightness.dark ? 'white' : 'black'}.png',
                    width: 100,
                  ),
                ),
                Flexible(child: SizedBox(height: 120)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect Your 100pay Account',
                      style: TextStyle(
                        fontFamily: 'space_grotesk',
                        fontSize: 20,
                        color: _isDarkMode ? Colors.white : Colors.black,
                        // color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Enter your account ID',
                      style: TextStyle(
                        fontFamily: 'space_grotesk',
                        fontSize: 14,
                        color: _isDarkMode ? Colors.white : Colors.black,
                        // color: theme.colorScheme.onSurface.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildApiKeyField(),
                  ],
                ),
                Align(
                  // alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: _isLoading
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
                            ),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;

                                Future.delayed(Duration(seconds: 5), () async {
                                  if (apiKeyController.text.isEmpty) {
                                    _showErrorMessage();
                                    _isLoading = false;
                                    return;
                                  }

                                  _isApiKeyValid =
                                      _validateApiKey(apiKeyController.text);

                                  await Provider.of<UserDataProvider>(
                                    context,
                                    listen: false,
                                  ).connectPOS(
                                    context,
                                    apiKeyController.text,
                                  );

                                  // Navigate to the next screen
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Pay100(),
                                  //   ),
                                  // );

                                  _isLoading = false;
                                });
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 1),
                            ),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontFamily: 'space_grotesk',
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an Account Yet? ',
                        style: TextStyle(
                          // color: Color.fromRGBO(242, 8, 49, 0.7),
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  titleTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'space_grotesk',
                                  ),
                                  contentTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'space_grotesk',
                                  ),
                                  title: Text('How to connect'),
                                  content: Text(
                                      'signup to 100pay by taping the  button, then copy the invite code and paste on the account id field then click continue to connect'),
                                  actions: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.grey,
                                              ),
                                              height: 48,
                                              child: Center(
                                                child: Text(
                                                  'Not now',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'space_grotesk',
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);

                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return Container(
                                                    color: Color(0xff757375),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.9,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.9,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: InAppWebView(
                                                            gestureRecognizers: {
                                                              Factory<
                                                                  VerticalDragGestureRecognizer>(
                                                                () =>
                                                                    VerticalDragGestureRecognizer(),
                                                              ),
                                                            },
                                                            initialUrlRequest:
                                                                URLRequest(
                                                              url: Uri.parse(
                                                                  'https://app.100pay.co/register'),
                                                            ),
                                                            initialOptions:
                                                                InAppWebViewGroupOptions(
                                                              crossPlatform:
                                                                  InAppWebViewOptions(
                                                                javaScriptEnabled:
                                                                    true,
                                                                useShouldOverrideUrlLoading:
                                                                    true, // iOS only: prevents navigation on tap
                                                                verticalScrollBarEnabled:
                                                                    true, // Enables vertical scrollbar
                                                                horizontalScrollBarEnabled:
                                                                    false, // Disables horizontal scrollbar
                                                                userAgent:
                                                                    'Mozilla/5.0',
                                                              ),
                                                            ),
                                                            onProgressChanged:
                                                                (controller,
                                                                    progress) {
                                                              setState(() =>
                                                                  this.progress =
                                                                      progress /
                                                                          100);
                                                            },
                                                            onWebViewCreated:
                                                                (controller) {
                                                              this.controller =
                                                                  controller;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Color.fromRGBO(
                                                    242, 8, 49, 1),
                                              ),
                                              height: 48,
                                              child: Center(
                                                child: Text(
                                                  'Got it',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'space_grotesk',
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // ElevatedButton(
                                    //   onPressed: () {},
                                    //   child: Text('Not now'),
                                    // ),
                                    // ElevatedButton(
                                    //   onPressed: () {},
                                    //   child: Text('Got it'),
                                    // ),
                                  ],
                                );
                              },
                            );
                          },
                        text: ' Sign Up',
                        style: TextStyle(
                          color: Color.fromRGBO(242, 8, 49, 0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  late InAppWebViewController controller;
  double progress = 0;
  Widget _buildApiKeyField() {
    return TextField(
      maxLength: 6,
      keyboardType: TextInputType.number,
      controller: apiKeyController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE5E7EB),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'eg: 123456',
        hintStyle: TextStyle(
          color: Color(0xffD1D5DB),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _isApiKeyValid = _validateApiKey(value);
        });
      },
    );
  }

  bool _validateApiKey(String value) {
    return value.startsWith('LIVE;PK;ey');
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: Please input a value.'),
        duration: Duration(seconds: 1),
      ),
    );
    _isLoading = false;
  }

  Future<void> saveApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiKey', apiKey);
    print('API key saved successfully: $apiKey');
  }
}
