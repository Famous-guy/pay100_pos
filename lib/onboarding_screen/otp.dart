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
// // //         title: Text('OTP Verification'),
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
// // //                 // Handle changes in OTP field if needed
// // //               },
// // //             ),
// // //             SizedBox(height: 20.0),
// // //             ElevatedButton(
// // //               onPressed: () {
// // //                 String otp = _otpController.text.trim();
// // //                 if (otp.length < 6) {
// // //                   // Show error message if OTP is less than 6 characters
// // //                   ScaffoldMessenger.of(context).showSnackBar(
// // //                     SnackBar(content: Text('OTP must be 6 characters long')),
// // //                   );
// // //                 } else {
// // //                   // OTP is valid, proceed with handling
// // //                   _handleSubmittedOTP(otp);
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
// //   final TextEditingController _otpController = TextEditingController();

// //   @override
// //   void dispose() {
// //     _otpController.dispose();
// //     super.dispose();
// //   }

// //   void _handleSubmittedOTP(String otp) {
// //     // Implement your logic here to handle the submitted OTP
// //     print('Submitted OTP: $otp');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Verify OTP'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             TextField(
// //               controller: _otpController,
// //               keyboardType: TextInputType.number,
// //               inputFormatters: [
// //                 FilteringTextInputFormatter.digitsOnly,
// //                 LengthLimitingTextInputFormatter(6),
// //               ],
// //               decoration: InputDecoration(
// //                 labelText: 'Enter OTP',
// //                 hintText: 'Enter 6-digit OTP',
// //                 border: OutlineInputBorder(),
// //               ),
// //               onChanged: (value) {
// //                 // Automatically submit OTP when it reaches 6 characters
// //                 if (value.length == 6) {
// //                   _handleSubmittedOTP(value);
// //                 }
// //               },
// //             ),
// //             SizedBox(height: 20.0),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Manually submit OTP when button is pressed
// //                 String otp = _otpController.text.trim();
// //                 if (otp.length == 6) {
// //                   _handleSubmittedOTP(otp);
// //                 } else {
// //                   // Show error message if OTP is not 6 characters long
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('OTP must be 6 characters long')),
// //                   );
// //                 }
// //               },
// //               child: Text('Verify OTP'),
// //             ),
// //             SizedBox(height: 20.0),
// //             TextButton(
// //               onPressed: () {
// //                 // Paste OTP from clipboard
// //                 Clipboard.getData('text/plain').then((value) {
// //                   if (value != null && value.text != null) {
// //                     _otpController.text = value.text!;
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
//   late List<TextEditingController> _otpControllers;

//   @override
//   void initState() {
//     super.initState();
//     _otpControllers = List.generate(6, (index) => TextEditingController());
//   }

//   @override
//   void dispose() {
//     _otpControllers.forEach((controller) => controller.dispose());
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(
//                 6,
//                 (index) => Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 4.0),
//                     child: TextField(
//                       controller: _otpControllers[index],
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                         LengthLimitingTextInputFormatter(1),
//                       ],
//                       textAlign: TextAlign.center,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (value) {
//                         if (value.isNotEmpty && index < 5) {
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 String otp =
//                     _otpControllers.map((controller) => controller.text).join();
//                 // Handle the submitted OTP
//                 print('Submitted OTP: $otp');
//               },
//               child: Text('Verify OTP'),
//             ),
//             SizedBox(height: 20.0),
//             TextButton(
//               onPressed: () {
//                 // Paste OTP from clipboard
//                 Clipboard.getData('text/plain').then((value) {
//                   if (value != null && value.text != null) {
//                     List<String> characters = value.text!.split('');
//                     if (characters.length <= 6) {
//                       for (int i = 0; i < characters.length; i++) {
//                         _otpControllers[i].text = characters[i];
//                       }
//                     }
//                   }
//                 });
//               },
//               child: Text('Paste OTP from Clipboard'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counter: Offstage(),
                      border: OutlineInputBorder(),
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
            ElevatedButton(
              onPressed: () {
                // Concatenate values from all fields
                String otp = _controllers.fold<String>(
                    '',
                    (previousValue, controller) =>
                        previousValue + controller.text);
                // Process the OTP
                _handleSubmittedOTP(otp);
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmittedOTP(String otp) {
    // Implement your logic here to handle the submitted OTP
    print('Submitted OTP: $otp');
  }
}
