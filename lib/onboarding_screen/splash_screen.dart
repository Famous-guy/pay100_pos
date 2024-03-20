// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pay100_pos/onboarding_screen/signin.dart';
// import 'package:pay100_pos/onboarding_screen/splash_screen1.dart';
// import 'package:pay100_pos/test.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ApiKeyModel extends ChangeNotifier {
//   bool _isInitialized = false;

//   bool get isInitialized => _isInitialized;

//   void initialize() {
//     _isInitialized = true;
//     notifyListeners();
//   }
// }

// class OnBoarding extends StatelessWidget {
//   const OnBoarding({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ApiKeyModel(),
//       builder: (context, child) {
//         final apiKeyModel = Provider.of<ApiKeyModel>(context);
//         if (!apiKeyModel.isInitialized) {
//           // Check API key on initialization
//           checkApiKey(context, apiKeyModel);
//         }
//         return Scaffold(
//           backgroundColor: Color.fromRGBO(242, 8, 49, 1),
//           body: SafeArea(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 250),
//                     child: Image.asset('assets/images/100pay_shop.png'),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: SvgPicture.asset(
//                       'assets/images/Subtract.svg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> checkApiKey(
//       BuildContext context, ApiKeyModel apiKeyModel) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? apiKey = prefs.getString('api_key');
//     await Future.delayed(Duration(seconds: 3));
//     if (apiKey != null && apiKey.isNotEmpty) {
//       // API key is stored, navigate to the homepage
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => Pay100()),
//       );
//     } else {
//       // API key is not stored, navigate to the initial onboarding screen
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => InitialOnboarding3()),
//       );
//     }
//     // Mark initialization as complete
//     apiKeyModel.initialize();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay100_pos/main.dart';
import 'package:pay100_pos/onboarding_screen/signin.dart';
import 'package:pay100_pos/onboarding_screen/splash_screen1.dart';
import 'package:pay100_pos/test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiKeyModel extends ChangeNotifier {
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  void initialize() {
    _isInitialized = true;
    notifyListeners();
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApiKeyModel(),
      builder: (context, child) {
        final apiKeyModel = Provider.of<ApiKeyModel>(context);
        if (!apiKeyModel.isInitialized) {
          // Check API key on initialization
          checkApiKey(context, apiKeyModel);
        }
        return Scaffold(
          backgroundColor: Color.fromRGBO(242, 8, 49, 1),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Image.asset('assets/images/100pay_shop.png'),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      'assets/images/Subtract.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> checkApiKey(
      BuildContext context, ApiKeyModel apiKeyModel) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? apiKey = prefs.getString('api_key');
    String? apiKey = await fetchApiKeyFromLocalStorage();
    await Future.delayed(Duration(seconds: 3));
    if (apiKey != null && apiKey.isNotEmpty) {
      // API key is stored, navigate to the homepage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Pay100()),
      );
    } else {
      // API key is not stored, navigate to the initial onboarding screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignIn()),
      );
    }
    // Mark initialization as complete
    apiKeyModel.initialize();
  }
}