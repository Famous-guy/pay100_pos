// // ... (your existing code)

// class _SignInState extends State<SignIn> {
//   // ... (your existing code)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ... (your existing code)
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               // ... (your existing code)

//               // Align(
//               //   alignment: Alignment.bottomRight,
//               //   child: SizedBox(
//               //     height: 48,
//               //     width: 136,
//               //     child: _isLoading
//               //         ? ElevatedButton(
//               //             onPressed: () {},
//               //             style: ElevatedButton.styleFrom(
//               //               shape: RoundedRectangleBorder(
//               //                   borderRadius: BorderRadius.circular(15)),
//               //               backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
//               //             ),
//               //             child: CircularProgressIndicator(
//               //               valueColor:
//               //                   AlwaysStoppedAnimation<Color>(Colors.white),
//               //             ),
//               //           )
//               //         : ElevatedButton(
//               //             onPressed: () {
//               //               setState(() {
//               //                 _isLoading = true;

//               //                 Future.delayed(Duration(seconds: 20), () {
//               //                   // Check if there is no input after the delay
//               //                   if (apiKeyController.text.isEmpty) {
//               //                     // Show error message
//               //                     _showErrorMessage();
//               //                     _isLoading = false;
//               //                     return;
//               //                   }

//               //                   // Continue with your logic if there is input
//               //                   _isApiKeyValid =
//               //                       _validateApiKey(apiKeyController.text);

//               //                   if (_isEmailValid &&
//               //                       _isUsernameValid &&
//               //                       _isApiKeyValid) {
//               //                     Navigator.push(
//               //                       context,
//               //                       MaterialPageRoute(
//               //                         builder: (context) => Pay100(
//               //                           apikey: apiKeyController.text,
//               //                         ),
//               //                       ),
//               //                     );
//               //                   }

//               //                   _isLoading = false;
//               //                 });
//               //               });
//               //             },
//               //             style: ElevatedButton.styleFrom(
//               //               shape: RoundedRectangleBorder(
//               //                   borderRadius: BorderRadius.circular(15)),
//               //               backgroundColor: Color.fromRGBO(242, 8, 49, 1),
//               //             ),
//               //             child: Row(
//               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //               children: [
//               //                 Text(
//               //                   'Continue',
//               //                   style: TextStyle(
//               //                       color: Color.fromRGBO(255, 255, 255, 1),
//               //                       fontWeight: FontWeight.w600,
//               //                       fontSize: 14),
//               //                 ),
//               //                 Icon(
//               //                   Icons.arrow_forward_ios,
//               //                   size: 16,
//               //                   weight: 100,
//               //                   color: Colors.white,
//               //                 ),
//               //               ],
//               //             ),
//               //           ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ... (your existing code)

//   void _showErrorMessage() {
//     // Implement the logic to show an error message (Snackbar or other UI element)
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: Please input a value.'),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
// }
