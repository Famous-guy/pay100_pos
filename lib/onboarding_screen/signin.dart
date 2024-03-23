// import 'package:flutter/material.dart';
// import 'package:pay100_pos/test.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:your_app_name/user_data_provider.dart';
// //// Import the provider class
// import '../provider/connectposprovider.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final apiKeyController = TextEditingController();
//   bool _isApiKeyValid = true;
//   bool _isLoading = false;
//   bool _isDarkMode = false; // Track the current theme mode

//   @override
//   Widget build(BuildContext context) {
//     String imageAssetPath = _isDarkMode
//         ? 'assets/images/100Paywhite.png'
//         : 'assets/images/100Payblack.png';

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Padding(
//                   padding: EdgeInsets.only(
//                 top: 40,
//               )),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.end,
//               //   children: [
//               //     Switch(
//               //       value: _isDarkMode,
//               //       onChanged: (value) {
//               //         setState(() {
//               //           _isDarkMode = value;
//               //         });
//               //       },
//               //     ),
//               //   ],
//               // ),

//               Container(
//                 margin: EdgeInsets.only(top: 10),
//                 child: Image.asset(
//                   imageAssetPath,
//                   width: 100,
//                 ),
//               ),
//               SizedBox(
//                 height: 120,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Connect Your 100pay Account',
//                       style: TextStyle(
//                         fontFamily: 'space_grotesk',
//                         fontSize: 20,
//                         color: _isDarkMode ? Colors.white : Color(0xff4B5563),
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Enter your account ID',
//                       style: TextStyle(
//                         fontFamily: 'space_grotesk',
//                         fontSize: 14,
//                         color: _isDarkMode ? Colors.white : Color(0xff344054),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     _buildApiKeyField(),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: SizedBox(
//                   height: 48,
//                   width: 136,
//                   child: _isLoading
//                       ? ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                             backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
//                           ),
//                           child: CircularProgressIndicator(
//                             valueColor:
//                                 AlwaysStoppedAnimation<Color>(Colors.white),
//                           ),
//                         )
//                       : ElevatedButton(
//                           onPressed: () async {
//                             setState(() {
//                               _isLoading = true;

//                               Future.delayed(Duration(seconds: 5), () async {
//                                 if (apiKeyController.text.isEmpty) {
//                                   _showErrorMessage();
//                                   _isLoading = false;
//                                   return;
//                                 }

//                                 _isApiKeyValid =
//                                     _validateApiKey(apiKeyController.text);

//                                 await Provider.of<UserDataProvider>(
//                                   context,
//                                   listen: false,
//                                 ).connectPOS(apiKeyController.text);

//                                 // Navigate to the next screen
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Pay100(),
//                                   ),
//                                 );

//                                 _isLoading = false;
//                               });
//                             });
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                             backgroundColor: Color.fromRGBO(242, 8, 49, 1),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Continue',
//                                 style: TextStyle(
//                                     color: Color.fromRGBO(255, 255, 255, 1),
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 14),
//                               ),
//                               Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: 16,
//                                 weight: 100,
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildApiKeyField() {
//     return TextField(
//       keyboardType: TextInputType.phone,
//       controller: apiKeyController,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xffE5E7EB),
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         hintText: 'eg: 293391',
//         hintStyle: TextStyle(
//           color: Color(0xffD1D5DB),
//         ),
//         // errorStyle: TextStyle(
//         //   color: _isApiKeyValid ? Colors.green : Colors.red,
//         // ),
//         // errorText: _isApiKeyValid
//         //     ? null
//         //     : 'Sorry, We cannot find an account with that wallet ID',
//       ),
//       onChanged: (value) {
//         setState(() {
//           _isApiKeyValid = _validateApiKey(value);
//         });
//       },
//     );
//   }

//   bool _validateApiKey(String value) {
//     return value.startsWith('LIVE;PK;ey');
//   }

//   void _showErrorMessage() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: Please input a value.'),
//         duration: Duration(seconds: 1),
//       ),
//     );
//     _isLoading = false;
//   }

//   Future<void> saveApiKey(String apiKey) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('apiKey', apiKey);
//     print('API key saved successfully: $apiKey');
//   }
// }

import 'package:flutter/material.dart';
import 'package:pay100_pos/test.dart';
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
  final apiKeyController = TextEditingController();
  bool _isApiKeyValid = true;
  bool _isLoading = false;

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
                SizedBox(height: 120),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect Your 100pay Account',
                        style: TextStyle(
                          fontFamily: 'space_grotesk',
                          fontSize: 20,
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter your account ID',
                        style: TextStyle(
                          fontFamily: 'space_grotesk',
                          fontSize: 14,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      _buildApiKeyField(),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 48,
                    width: 136,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  weight: 100,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),

                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: SizedBox(
                //     height: 48,
                //     width: 136,
                //     child: _isLoading
                //         ? ElevatedButton(
                //             onPressed: () {},
                //             style: ElevatedButton.styleFrom(
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(15)),
                //               backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
                //             ),
                //             child: CircularProgressIndicator(
                //               valueColor:
                //                   AlwaysStoppedAnimation<Color>(Colors.white),
                //             ),
                //           )
                //         : ElevatedButton(
                //             onPressed: () async {
                //               // setState(() {
                //               //   _isLoading = true;
                //               //   // Your logic for handling API key entry and navigation
                //               // });
                //             },
                //             style: ElevatedButton.styleFrom(
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(15)),
                //               backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
                //             ),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   'Continue',
                //                   style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.w600,
                //                     fontSize: 14,
                //                   ),
                //                 ),
                //                 Icon(
                //                   Icons.arrow_forward_ios,
                //                   size: 16,
                //                   color: Colors.white,
                //                 ),
                //               ],
                //             ),
                //           ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildApiKeyField() {
    return TextField(
      maxLength: 6,
      // minLines: 6,
      // maxLines: 6,

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
        hintText: 'eg: 293391',
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
