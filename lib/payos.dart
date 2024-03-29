import 'dart:async';
import 'dart:io';

// import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:intl/intl.dart';

import 'package:pay100_pos/exports/export.dart';
import 'package:pay100_pos/provider/getpayment.dart';
import 'package:pay100_pos/qrscan.dart';

class Pay100 extends StatefulWidget {
  // final String apikey;

  const Pay100({
    Key? key,
    // required this.apikey,
  }) : super(key: key);

  @override
  State<Pay100> createState() => _Pay100State();
}

class _Pay100State extends State<Pay100> {
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
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
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
  final int maxLength = 10;
  String? apiKey;
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
  bool _isDarkMode = false;
  late String currencySymbol;
  String? paymentInput;
  String? paymentNumber;
  String? paymentDes;
  void initState() {
    super.initState();
    // getConnectivity();
    logSignInOrOut('Sign In');
    _initializeData();
    _fetchCurrencyData();

    // fetchApiKeyFromFirestore();flu
  }

  Future<void> _initializeData() async {
    // Fetch apiKey and other initial data here
    apiKey = await Provider.of<AuthProvider>(context, listen: false).apiKey;
    // Set other initial state variables if needed
    setState(() {});
  }

  String? currency;
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
        return GestureDetector(
          onTap: () {
            // Dismiss the keyboard when tapping outside the text fields
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Container(
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
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      border: OutlineInputBorder(),
                      errorText: _isEmailValid
                          ? null
                          : 'Please enter a valid email address',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: number,
                    onChanged: (value) {
                      paymentNumber = value;
                      setState(() {
                        _isNumberValid = _validateNumber(value);
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText:
                          _isNumberValid ? null : 'Please your phone number',
                      labelText: 'Phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: description,
                    onChanged: (value) {
                      paymentDes = value;
                      setState(() {
                        _isMetaDataValid = _validateMetaData(value);
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      // errorText: _isMetaDataValid
                      //     ? null
                      //     : 'Please you need to input a description of payment',
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isEmailValid = _validateEmail(emailController.text);
                          _isNumberValid = _validateNumber(number.text);
                          // _isMetaDataValid =
                          //     _validateMetaData(description.text);

                          if (_isEmailValid &&
                              _isMetaDataValid &&
                              _isNumberValid) {
                            Navigator.pop(context);
                            makePayment();
                          }
                        });
                      },
                      child: Text(
                        'Proceed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // bool _isModalOpen = false;
  Future<void> makePayment() async {
    // String? apiKey = (await getUserDataFromPrefs()) as String?;
    // var userData = Provider.of<UserDataProvider>(context);
    UserData userData = await getUserDataFromPrefs(); // Retrieve user data
    String? publicKey = userData.publicKey;
    String? userid = userData.accountId;
    String? currency = userData.currency;
    String? username = userData.accountName;
    // String? email = userData.email;
    String? business = userData.businessId;
    // Implement your logic to make payment with the entered amount
    if (paymentInput != null &&
        paymentInput!.isNotEmpty &&
        paymentNumber!.isNotEmpty) {
      // Adapt the logic as needed
      HundredPay.makePayment(
        customerEmail: paymentInput!,
        customerPhoneNumber: paymentNumber!,
        customerName: username,
        customerUserId: userid,
        amount: displayedExpression.replaceAll(',', ''),
        userId: '$business',
        refId: '012232',
        description: paymentDes!,
        apiKey: '$publicKey',
        currency: currency,
        country: currency,
        chargeSource: '10',
        callBackUrl:
            'https://api.100pay.co/api/v1/pay/crypto/payment/$business',
        onError: (error) {},
        context: context,
      );
      // _isModalOpen = true;
    }
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

  Widget buildButton(String buttonText) {
    EdgeInsetsGeometry padding = const EdgeInsets.all(15);
    double fontSize = 36.0;
    Widget buttonChild;

    if (buttonText == 'Del') {
      padding = const EdgeInsets.all(19);
      fontSize = 36.0;
      buttonChild = displayedExpression.isEmpty
          ? Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.black,
              size: 36,
            )
          : ImageIcon(
              AssetImage(
                'assets/images/tag-cross.png',
              ),
              size: 36, // Adjust the size of the icon as needed
              color: _isDarkMode ? Colors.white : Colors.black,
            ); // Replace text with icon for 'Del' button
    } else {
      buttonChild = Text(
        buttonText,
        style: TextStyle(
          fontFamily: 'space_grotesk',
          fontSize: fontSize,
          color: _isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ); // Render text for other buttons
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _isDarkMode
              ? Colors.grey[800]
              : const Color.fromRGBO(243, 244, 246, 1),
          shape: const CircleBorder(),
          padding: buttonText == 'Del' ? padding : EdgeInsets.all(12),
        ),
        onPressed: () => onButtonPressed(buttonText),
        child: buttonChild,
      ),
    );
  }

  Widget buildCalculatorButtons() {
    return Table(
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
    );
  }

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
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const QRViewExample(),
          ));
        }
      } else {
        if (displayedExpression.length < 15) {
          displayedExpression += buttonText;
          displayedExpression = formatNumber(displayedExpression);
        }
      }
    });
  }

  String getCurrencySymbol(String? currency) {
    if (currency != null && currencies.containsKey(currency)) {
      return currencies[currency]!;
    } else {
      return ''; // Return empty string if currency not found
    }
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;

    _isDarkMode = brightness == Brightness.dark;

    apiKey = Provider.of<AuthProvider>(context).apiKey;
    const green = Color(0xFF45CC0D);
    String imageAssetPath = _isDarkMode
        ? 'assets/images/100Paywhite.png'
        : 'assets/images/100Payblack.png';
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Check if the swipe gesture ends on the right end of the screen
        if (details.primaryVelocity! < 0) {
          // Swiped from right to left (RTL)
          setState(() {
            // Check if displayedExpression is not empty before deleting
            if (displayedExpression.isNotEmpty) {
              // Remove the last character from displayedExpression
              displayedExpression = displayedExpression.substring(
                0,
                displayedExpression.length - 1,
              );
            }
          });
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65, bottom: 37.28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          imageAssetPath,
                          // "assets/images/100pay.png",
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    // Divider(),
                    SizedBox(
                      height: 60,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pay100Token(),
                            ));
                      },
                      leading: Icon(Icons.account_circle),
                      title: Text(
                        'My Account',
                        style: TextStyle(
                          fontFamily: 'space_grotesk',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textColor: _isDarkMode ? Colors.white : Colors.black,
                    ),

                    ListTile(
                      onTap: () async {
                        UserData userData =
                            await getUserDataFromPrefs(); // Retrieve user data
                        String? token = userData.token;
                        String? business = userData.businessId;
                        await Provider.of<PaymentProvider>(
                          context,
                          listen: false,
                        ).fetchPaymentData(
                          // auth_token: token.toString(),
                          // businessID: business.toString(),
                        );

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Account(),
                        //     ));
                      },
                      splashColor: Color.fromRGBO(153, 172, 241, 0.11),
                      leading: ImageIcon(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        AssetImage(
                          'assets/images/clock.png',
                        ),
                      ),
                      title: Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'space_grotesk',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textColor: _isDarkMode ? Colors.white : Colors.black,
                    ),
                    ListTile(
                      leading: Icon(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        Icons.support,
                      ),
                      title: Text(
                        'Support',
                        style: TextStyle(
                          fontFamily: 'space_grotesk',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textColor: _isDarkMode ? Colors.white : Colors.black,
                    ),

                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const QRViewExample(),
                        ));
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => QRViewExample(),
                        //   ),
                        // );
                      },
                      leading: Icon(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        Icons.qr_code_scanner,
                      ),
                      title: Text(
                        'Scan Qr Code',
                        style: TextStyle(
                          fontFamily: 'space_grotesk',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textColor: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 80,
                          child: Center(
                            child: ListTile(
                              onTap: () async {
                                print('about to get cleared!');
                                clearSharedPreferences();
                                print('cleared');
                                await logSignInOrOut('Sign Out');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
                              },
                              title: Text("Log Out",
                                  style: TextStyle(
                                      color: _isDarkMode
                                          ? Colors.white
                                          : Colors
                                              .black)), // Change font color based on _isDarkMode
                              leading: Icon(Icons.logout,
                                  color: _isDarkMode
                                      ? Colors.white
                                      : Colors
                                          .black), // Change font color based on _isDarkMode
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
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                icon: const Icon(
                                  Icons.account_circle,
                                  color: Colors.redAccent,
                                  size: 40,
                                ),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                tooltip: MaterialLocalizations.of(context)
                                    .openAppDrawerTooltip,
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
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
                                // spacing: 45.0,
                                animationCurve: Curves.easeInOut,
                                animationDuration:
                                    const Duration(milliseconds: 200),
                                style: ToggleStyle(
                                  borderColor: Colors.transparent,
                                  indicatorColor: Colors.white,
                                  backgroundColor: Colors.black,
                                ),
                                styleBuilder: (value) => ToggleStyle(
                                    backgroundColor: value
                                        ? Color(0xffF20831)
                                        : Color(0xffF20831)),
                                borderWidth: 5.0,
                                // height: 60.0,
                                loadingIconBuilder: (context, global) =>
                                    CupertinoActivityIndicator(
                                        color: Color.lerp(Color(0xffF20831),
                                            green, global.position)),
                                onChanged: (b) => setState(() => positive = b),
                                iconBuilder: (value) => value
                                    ? Icon(Icons.account_circle,
                                        color: Color(0xffF20831), size: 20.0)
                                    : Image.asset(
                                        'assets/images/100pay4.png',
                                        height: 16,
                                      ),
                                textBuilder: (value) => value
                                    ? Align(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: Text(
                                          'Input',
                                          style: TextStyle(fontSize: 15),
                                        ))
                                    : Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: Text(
                                          'Express',
                                          style: TextStyle(fontSize: 11.5),
                                        )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  displayedExpression.isEmpty ||
                                          displayedExpression.startsWith('0')
                                      ? '$currencySymbol 0.00'
                                      : '$currencySymbol $displayedExpression',
                                  style: TextStyle(
                                    fontFamily: 'space_grotesk',
                                    fontSize: 36.0,
                                    color: _isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: buildCalculatorButtons(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 65,
                              vertical: 30,
                            ),
                            child: SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (displayedExpression.isNotEmpty) {
                                    if (positive) {
                                      _showInputBottomSheet();
                                      // Code for 'Input' action
                                      print('Input Button Pressed');
                                    } else {
                                      UserData userData =
                                          await getUserDataFromPrefs(); // Retrieve user data
                                      String? publicKey = userData.publicKey;
                                      String? userid = userData.accountId;
                                      String? currency = userData.currency;
                                      String? email = userData.email;
                                      String? phonenumber = userData.phone;
                                      String? username = userData.accountName;
                                      String? business = userData.businessId;

                                      var api = HundredPay.makePayment(
                                        customerEmail: email,
                                        customerPhoneNumber: '$phonenumber',
                                        customerName: '$username',
                                        customerUserId: userid,
                                        amount: displayedExpression.replaceAll(
                                            ',', ''),
                                        userId: business,
                                        refId: '012232',
                                        description: 'express payment',
                                        apiKey: '$publicKey',
                                        currency: currency,
                                        country: 'NG',
                                        chargeSource: 'api',
                                        callBackUrl:
                                            'https://api.100pay.co/api/v1/pay/crypto/payment/$business',
                                        onError: (error) {},
                                        context: context,
                                      );
                                      // _isModalOpen = true;
                                      // Code for 'Express' action
                                      print('Express Button Pressed');

                                      print(api.hashCode);
                                    }
                                  }
                                  // Define the actions for 'Input' and 'Express' here
                                },
                                child: Text(
                                  positive ? 'Recieve' : 'Instant Recieve',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: positive
                                      ? Color(0xffF20831)
                                      : Color(0xffF20831),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchCurrencyData() async {
    // Fetch currency data asynchronously
    UserData userData = await getUserDataFromPrefs();
    currencySymbol = getCurrencySymbol(userData.currency);
    setState(() {}); // Update UI when currency data is available
  }

  void clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
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
