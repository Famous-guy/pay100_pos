// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pay100_pos/onboarding_screen/splash_screen.dart';
import 'package:pay100_pos/provider/auth.dart';
import 'package:pay100_pos/test.dart';
import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/config/config.dart';
// import 'package:flutter_launcher_icons/config/config.g.dart';
import 'package:flutter_launcher_icons/config/macos_config.dart';
// import 'package:flutter_launcher_icons/config/macos_config.g.dart';
import 'package:flutter_launcher_icons/config/web_config.dart';
// import 'package:flutter_launcher_icons/config/web_config.g.dart';
import 'package:flutter_launcher_icons/config/windows_config.dart';
// import 'package:flutter_launcher_icons/config/windows_config.g.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_generator.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_template.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_launcher_icons/web/web_template.dart';
import 'package:flutter_launcher_icons/windows/windows_icon_generator.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  // Fetch API key from local storage
  String? apiKey = await fetchApiKeyFromLocalStorage();
  runApp(const Pay100Shop());
}

Future<String?> fetchApiKeyFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('apiKey');
}

class Pay100Shop extends StatefulWidget {
  const Pay100Shop({super.key});

  @override
  State<Pay100Shop> createState() => _Pay100ShopState();
}

class _Pay100ShopState extends State<Pay100Shop> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoarding(),
      ),
    );
  }
}
