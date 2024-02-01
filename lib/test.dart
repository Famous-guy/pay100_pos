import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hundredpay/hundredpay.dart';
import 'package:pay100_pos/onboarding_screen/settings.dart';
// import 'package:pay100_pos/rough.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:pay100_pos/my_account.dart';
import 'package:pay100_pos/onboarding_screen/signin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Pay100 extends StatefulWidget {
  final String apikey;

  const Pay100({
    Key? key,
    required this.apikey,
  }) : super(key: key);

  @override
  State<Pay100> createState() => _Pay100State();
}

class _Pay100State extends State<Pay100> {
  final int maxLength = 10;
  final apiKe = TextEditingController();
  final emailController = TextEditingController();
  final username = TextEditingController();
  final number = TextEditingController();
  final description = TextEditingController();
  bool _isEmailValid = true;
  bool _isNumberValid = true;
  bool _isMetaDataValid = true;
  bool isLoading = false;
  String displayedExpression = "";
  var controller = WebViewController();

  @override
  String? paymentInput;
  void initState() {
    super.initState();
    logSignInOrOut('Sign In');
  }

  Future<void> logSignInOrOut(String event) async {
    final prefs = await SharedPreferences.getInstance();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formattedDate = formatter.format(DateTime.now());
    final log = prefs.getStringList('log') ?? [];
    log.add('$event - $formattedDate');
    await prefs.setStringList('log', log);
    print('User $event at $formattedDate');
  }

  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;

  bool val = false;

  void _showInputBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Customers Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  paymentInput = value;
                  setState(() {
                    _isEmailValid = _validateEmail(value);
                  });
                },
                keyboardType: TextInputType.emailAddress,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                  // hintText: 'Enter your email address',
                  errorText: _isEmailValid
                      ? null
                      : 'Please enter a valid email address',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: number,
                onChanged: (value) {
                  paymentInput = value;
                  setState(() {
                    _isNumberValid = _validateNumber(value);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: _isNumberValid
                      ? null
                      : 'Please enter a valid email address',
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: description,
                onChanged: (value) {
                  paymentInput = value;
                  setState(() {
                    _isMetaDataValid = _validateMetaData(value);
                  });
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  errorText: _isMetaDataValid
                      ? null
                      : 'Please enter a valid email address',
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    setState(() {
                      _isEmailValid = _validateEmail(emailController.text);
                      _isNumberValid = _validateNumber(number.text);
                      _isMetaDataValid = _validateMetaData(description.text);

                      if (_isEmailValid && _isMetaDataValid && _isNumberValid) {
                        Navigator.pop(context);
                        // Call the function to make payment with the entered amount
                        makePayment();
                      }
                    });
                    // if (_isEmailValid) {

                    // }
                  },
                  child: Text('Proceed', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        );
      },
    );
  }

  void makePayment() {
    // Implement your logic to make payment with the entered amount
    if (paymentInput != null && paymentInput!.isNotEmpty) {
      // Adapt the logic as needed
      HundredPay.makePayment(
        customerEmail: paymentInput!,
        customerPhoneNumber: paymentInput!,
        customerName: 'widget.userName',
        customerUserId: '293391',
        amount: displayedExpression.replaceAll(',', ''),
        userId: '6143bfb7fe85e0020bf243f9',
        refId: '012232',
        description: paymentInput!,
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

  String formatNumber(String input) {
    if (input.isEmpty) return "";
    // Handling floating point numbers
    if (input.contains('.')) {
      var parts = input.split('.');
      var formattedIntegerPart = NumberFormat("#,###")
          .format(int.tryParse(parts[0].replaceAll(",", "")) ?? 0);
      // Return the formatted integer part and the decimal part as a double
      return formattedIntegerPart + (parts.length > 1 ? '.' + parts[1] : '');
    } else {
      return NumberFormat("#,###")
          .format(int.tryParse(input.replaceAll(",", "")) ?? 0);
    }
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
              buildButton('.'),
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

  // void onButtonPressed(String buttonText) {
  //   setState(() {
  //     if (buttonText == '.') {
  //       if (!displayedExpression.contains('.')) {
  //         displayedExpression += buttonText;
  //       }
  //     } else if (buttonText == 'Del') {
  //       if (displayedExpression.isNotEmpty) {
  //         displayedExpression = formatNumber(
  //           displayedExpression.substring(0, displayedExpression.length - 1),
  //         );
  //       }
  //     } else {
  //       displayedExpression += buttonText;
  //       displayedExpression = formatNumber(displayedExpression);
  //     }
  //   });
  // }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '.') {
        if (!displayedExpression.contains('.') &&
            displayedExpression.length < 15) {
          displayedExpression += buttonText;
        }
      } else if (buttonText == 'Del') {
        if (displayedExpression.isNotEmpty) {
          displayedExpression = formatNumber(
            displayedExpression.substring(0, displayedExpression.length - 1),
          );
        }
      } else {
        if (displayedExpression.length < 15) {
          displayedExpression += buttonText;
          displayedExpression = formatNumber(displayedExpression);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF45CC0D);
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/100pay.png",
                        width: 100,
                      ),
                      // Text(
                      //   "Welcome ${widget.userName}",
                      //   style:
                      //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      // )
                    ],
                  ),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Account(),
                                ));
                          },
                          // focusColor: Colors.amber,
                          splashColor: Color.fromRGBO(153, 172, 241, 0.11),

                          leading: Icon(Icons.account_circle,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                          title: Text("My Account Profile"),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(3, 41, 174, 1)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
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
                                  builder: (context) => MySettingsPage(),
                                ));
                          },
                          // focusColor: Colors.amber,
                          splashColor: Color.fromRGBO(153, 172, 241, 0.11),

                          leading: Icon(Icons.settings,
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
                              onTap: () async {
                                await logSignInOrOut('Sign Out');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
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
                size: 40,
                Icons.account_circle,
                color: Colors.redAccent,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              height: 40,
              width: 120,
              child: DefaultTextStyle.merge(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                child: IconTheme.merge(
                  data: IconThemeData(color: Colors.white),
                  child: AnimatedToggleSwitch<bool>.dual(
                    current: positive,
                    first: false,
                    second: true,
                    spacing: 45.0,
                    animationCurve: Curves.easeInOut,
                    animationDuration: const Duration(milliseconds: 600),
                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      indicatorColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    styleBuilder: (value) => ToggleStyle(
                        backgroundColor: value ? green : Colors.red[800]),
                    borderWidth: 5.0,
                    height: 60.0,
                    loadingIconBuilder: (context, global) =>
                        CupertinoActivityIndicator(
                            color: Color.lerp(
                                Colors.red[800], green, global.position)),
                    onChanged: (b) => setState(() => positive = b),
                    iconBuilder: (value) => value
                        ? Icon(Icons.account_circle, color: green, size: 20.0)
                        : Image.asset(
                            'assets/images/100pay4.png',
                            height: 16,
                          ),
                    // Icon(Icons.payment_rounded,
                    // color: Colors.red[800], size: 20.0),
                    textBuilder: (value) => value
                        ? Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'Input',
                              style: TextStyle(fontSize: 15),
                            ))
                        : Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              'Express',
                              style: TextStyle(fontSize: 11.5),
                            )),
                  ),
                ),
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => RoughScreen(title: ''),
          //         ));
          //   },
          //   child: Icon(Icons.arrow_circle_left),
          // )
        ],
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
            // Padding(
            //   padding: const EdgeInsets.all(40),
            //   child: SizedBox(
            //     height: 40,
            //     width: double.infinity,
            //     child: isLoading
            //         ? const CircularProgressIndicator()
            //         : ElevatedButton(
            //             onPressed: () {
            //               if (displayedExpression.isNotEmpty) {
            //                 if (positive) {
            //                   // Code for 'Input' action
            //                   print('Input Button Pressed');
            //                 } else {
            //                   // Code for 'Express' action
            //                   print('Express Button Pressed');
            //                 }
            //                 _showInputBottomSheet();
            //                 // HundredPay.makePayment(
            //                 //   customerEmail: 'widget.emailAddress',
            //                 //   customerPhoneNumber: '08121154848',
            //                 //   customerName: 'widget.userName',
            //                 //   customerUserId: '293391',
            //                 //   amount: displayedExpression.replaceAll(',', ''),
            //                 //   userId: '6143bfb7fe85e0020bf243f9',
            //                 //   refId: '012232',
            //                 //   description: 'MY POS',
            //                 //   apiKey: widget.apikey,
            //                 //   currency: 'NGN',
            //                 //   country: 'NG',
            //                 //   chargeSource: '10',
            //                 //   callBackUrl:
            //                 //       'https://api.100pay.co/api/v1/pay/crypto/payment/6143bfb7fe85e0020bf243f9',
            //                 //   onError: (error) {},
            //                 //   context: context,
            //                 // );
            //               }
            //             },
            //             style: ElevatedButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //               backgroundColor: Colors.red,
            //             ),
            //             child: const Text(
            //               "Proceed",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (displayedExpression.isNotEmpty) {
                      if (positive) {
                        _showInputBottomSheet();
                        // Code for 'Input' action
                        print('Input Button Pressed');
                      } else {
                        HundredPay.makePayment(
                          customerEmail: 'gideongabriel557@gmail.com',
                          customerPhoneNumber: '08121154848',
                          customerName: 'Gideon Gabriel',
                          customerUserId: '293391',
                          amount: displayedExpression.replaceAll(',', ''),
                          userId: '6143bfb7fe85e0020bf243f9',
                          refId: '012232',
                          description: 'for garri',
                          apiKey: widget.apikey,
                          currency: 'NGN',
                          country: 'NG',
                          chargeSource: '10',
                          callBackUrl:
                              'https://api.100pay.co/api/v1/pay/crypto/payment/6143bfb7fe85e0020bf243f9',
                          onError: (error) {},
                          context: context,
                        );
                        // Code for 'Express' action
                        print('Express Button Pressed');
                      }
                    }
                    // Define the actions for 'Input' and 'Express' here
                  },
                  child: Text(
                    positive ? 'Input details' : 'Express',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: positive ? Colors.green : Colors.red[800],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateEmail(String value) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value);
  }

  bool _validateNumber(String value) {
    return value.isNotEmpty;
  }

  bool _validateMetaData(String value) {
    return value.isNotEmpty;
  }
}
