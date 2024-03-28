// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/services.dart';

// // // // class OTPScreen extends StatefulWidget {
// // // //   @override
// // // //   _OTPScreenState createState() => _OTPScreenState();
// // // // }

// // // // class _OTPScreenState extends State<OTPScreen> {
// // // //   final TextEditingController _otpController = TextEditingController();

// // // //   @override
// // // //   void dispose() {
// // // //     _otpController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _handleSubmittedOTP(String otp) {
// // // //     // Implement your logic here to handle the submitted OTP
// // // //     print('Submitted OTP: $otp');
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('OTP Verification'),
// // // //       ),
// // // //       body: Padding(
// // // //         padding: EdgeInsets.all(20.0),
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           crossAxisAlignment: CrossAxisAlignment.stretch,
// // // //           children: [
// // // //             TextField(
// // // //               controller: _otpController,
// // // //               keyboardType: TextInputType.number,
// // // //               inputFormatters: [
// // // //                 FilteringTextInputFormatter.digitsOnly,
// // // //                 LengthLimitingTextInputFormatter(6),
// // // //               ],
// // // //               decoration: InputDecoration(
// // // //                 labelText: 'Enter OTP',
// // // //                 hintText: 'Enter 6-digit OTP',
// // // //                 border: OutlineInputBorder(),
// // // //               ),
// // // //               onChanged: (value) {
// // // //                 // Handle changes in OTP field if needed
// // // //               },
// // // //             ),
// // // //             SizedBox(height: 20.0),
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 String otp = _otpController.text.trim();
// // // //                 if (otp.length < 6) {
// // // //                   // Show error message if OTP is less than 6 characters
// // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // //                     SnackBar(content: Text('OTP must be 6 characters long')),
// // // //                   );
// // // //                 } else {
// // // //                   // OTP is valid, proceed with handling
// // // //                   _handleSubmittedOTP(otp);
// // // //                 }
// // // //               },
// // // //               child: Text('Verify OTP'),
// // // //             ),
// // // //             SizedBox(height: 20.0),
// // // //             TextButton(
// // // //               onPressed: () {
// // // //                 // Paste OTP from clipboard
// // // //                 Clipboard.getData('text/plain').then((value) {
// // // //                   if (value != null && value.text != null) {
// // // //                     _otpController.text = value.text!;
// // // //                   }
// // // //                 });
// // // //               },
// // // //               child: Text('Paste OTP from Clipboard'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';

// // // class OTPScreen extends StatefulWidget {
// // //   @override
// // //   _OTPScreenState createState() => _OTPScreenState();
// // // }

// // // class _OTPScreenState extends State<OTPScreen> {
// // //   final TextEditingController _otpController = TextEditingController();

// // //   @override
// // //   void dispose() {
// // //     _otpController.dispose();
// // //     super.dispose();
// // //   }

// // //   void _handleSubmittedOTP(String otp) {
// // //     // Implement your logic here to handle the submitted OTP
// // //     print('Submitted OTP: $otp');
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Verify OTP'),
// // //       ),
// // //       body: Padding(
// // //         padding: EdgeInsets.all(20.0),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           crossAxisAlignment: CrossAxisAlignment.stretch,
// // //           children: [
// // //             TextField(
// // //               controller: _otpController,
// // //               keyboardType: TextInputType.number,
// // //               inputFormatters: [
// // //                 FilteringTextInputFormatter.digitsOnly,
// // //                 LengthLimitingTextInputFormatter(6),
// // //               ],
// // //               decoration: InputDecoration(
// // //                 labelText: 'Enter OTP',
// // //                 hintText: 'Enter 6-digit OTP',
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //               onChanged: (value) {
// // //                 // Automatically submit OTP when it reaches 6 characters
// // //                 if (value.length == 6) {
// // //                   _handleSubmittedOTP(value);
// // //                 }
// // //               },
// // //             ),
// // //             SizedBox(height: 20.0),
// // //             ElevatedButton(
// // //               onPressed: () {
// // //                 // Manually submit OTP when button is pressed
// // //                 String otp = _otpController.text.trim();
// // //                 if (otp.length == 6) {
// // //                   _handleSubmittedOTP(otp);
// // //                 } else {
// // //                   // Show error message if OTP is not 6 characters long
// // //                   ScaffoldMessenger.of(context).showSnackBar(
// // //                     SnackBar(content: Text('OTP must be 6 characters long')),
// // //                   );
// // //                 }
// // //               },
// // //               child: Text('Verify OTP'),
// // //             ),
// // //             SizedBox(height: 20.0),
// // //             TextButton(
// // //               onPressed: () {
// // //                 // Paste OTP from clipboard
// // //                 Clipboard.getData('text/plain').then((value) {
// // //                   if (value != null && value.text != null) {
// // //                     _otpController.text = value.text!;
// // //                   }
// // //                 });
// // //               },
// // //               child: Text('Paste OTP from Clipboard'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// // class OTPScreen extends StatefulWidget {
// //   @override
// //   _OTPScreenState createState() => _OTPScreenState();
// // }

// // class _OTPScreenState extends State<OTPScreen> {
// //   late List<TextEditingController> _otpControllers;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _otpControllers = List.generate(6, (index) => TextEditingController());
// //   }

// //   @override
// //   void dispose() {
// //     _otpControllers.forEach((controller) => controller.dispose());
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('OTP Verification'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: List.generate(
// //                 6,
// //                 (index) => Expanded(
// //                   child: Padding(
// //                     padding: EdgeInsets.symmetric(horizontal: 4.0),
// //                     child: TextField(
// //                       controller: _otpControllers[index],
// //                       keyboardType: TextInputType.number,
// //                       inputFormatters: [
// //                         FilteringTextInputFormatter.digitsOnly,
// //                         LengthLimitingTextInputFormatter(1),
// //                       ],
// //                       textAlign: TextAlign.center,
// //                       decoration: InputDecoration(
// //                         border: OutlineInputBorder(),
// //                       ),
// //                       onChanged: (value) {
// //                         if (value.isNotEmpty && index < 5) {
// //                           FocusScope.of(context).nextFocus();
// //                         }
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20.0),
// //             ElevatedButton(
// //               onPressed: () {
// //                 String otp =
// //                     _otpControllers.map((controller) => controller.text).join();
// //                 // Handle the submitted OTP
// //                 print('Submitted OTP: $otp');
// //               },
// //               child: Text('Verify OTP'),
// //             ),
// //             SizedBox(height: 20.0),
// //             TextButton(
// //               onPressed: () {
// //                 // Paste OTP from clipboard
// //                 Clipboard.getData('text/plain').then((value) {
// //                   if (value != null && value.text != null) {
// //                     List<String> characters = value.text!.split('');
// //                     if (characters.length <= 6) {
// //                       for (int i = 0; i < characters.length; i++) {
// //                         _otpControllers[i].text = characters[i];
// //                       }
// //                     }
// //                   }
// //                 });
// //               },
// //               child: Text('Paste OTP from Clipboard'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class OTPScreen extends StatefulWidget {
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   List<TextEditingController> _controllers =
//       List.generate(6, (_) => TextEditingController());
//   List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

//   @override
//   void dispose() {
//     _controllers.forEach((controller) => controller.dispose());
//     _focusNodes.forEach((node) => node.dispose());
//     super.dispose();
//   }

//   bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Verify OTP'),
//       // ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Text(
//                 'Verify OTP',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontFamily: 'space_grotesk',
//                 ),
//               ),
//               Flexible(
//                 child: SizedBox(
//                   height: 120,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(
//                   6,
//                   (index) => SizedBox(
//                     width: 40,
//                     height: 60,
//                     child: TextField(
//                       controller: _controllers[index],
//                       focusNode: _focusNodes[index],
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       maxLength: 1,
//                       decoration: InputDecoration(
//                         counter: Offstage(),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                       onChanged: (value) {
//                         // Move focus to the next field if text is entered
//                         if (value.isNotEmpty && index < 5) {
//                           FocusScope.of(context)
//                               .requestFocus(_focusNodes[index + 1]);
//                         }
//                         // Handle deleting content
//                         else if (value.isEmpty && index > 0) {
//                           FocusScope.of(context)
//                               .requestFocus(_focusNodes[index - 1]);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),

//               Align(
//                 // alignment: Alignment.bottomRight,
//                 child: SizedBox(
//                   height: 48,
//                   width: double.infinity,
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

//                                 await Provider.of<SendPos>(
//                                   context,
//                                   listen: false,
//                                 ).sendPos(context, apiKeyController.text);

//                                 // Navigate to the next screen
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => Pay100(),
//                                 //   ),
//                                 // );

//                                 _isLoading = false;
//                               });
//                             });
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                             backgroundColor: Color.fromRGBO(242, 8, 49, 1),
//                           ),
//                           child: Text(
//                             'Continue',
//                             style: TextStyle(
//                                 fontFamily: 'space_grotesk',
//                                 color: Color.fromRGBO(255, 255, 255, 1),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 14),
//                           ),
//                         ),
//                 ),
//               ),

//               // ElevatedButton(
//               //   onPressed: () {
//               //     // Concatenate values from all fields
//               //     String otp = _controllers.fold<String>(
//               //         '',
//               //         (previousValue, controller) =>
//               //             previousValue + controller.text);
//               //     // Process the OTP
//               //     _handleSubmittedOTP(otp);
//               //   },
//               //   child: Text('Verify OTP'),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleSubmittedOTP(String otp) {
//     // Implement your logic here to handle the submitted OTP
//     print('Submitted OTP: $otp');
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay100_pos/provider/connectposprovider.dart';
import 'package:provider/provider.dart';
// import 'package:pay100_pos/provider/sendpos.dart';

class OTPScreen extends StatefulWidget {
  final accountid;

  OTPScreen({required this.accountid});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  TextEditingController apiKeyController = TextEditingController();

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  bool _isLoading = false;
  bool _isApiKeyValid = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus all text fields when tapping outside
        _focusNodes.forEach((node) => node.unfocus());
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'space_grotesk',
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 120,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: 40,
                      height: 60,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          // Move focus to the next field if text is entered
                          if (value.isNotEmpty && index < 5) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          }
                          // Handle deleting content
                          else if (value.isEmpty && index > 0) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index - 1]);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: _isLoading
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
                            ),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await Provider.of<UserDataProvider>(
                                context,
                                listen: false,
                              ).connectPOS(
                                  context: context,
                                  inviteCode: widget.accountid,
                                  otp:
                                      _controllers.map((c) => c.text).join(''));
                              // connectPOS(context,
                              //     _controllers.map((c) => c.text).join(''), widget.);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 1),
                            ),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontFamily: 'space_grotesk',
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
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
