import 'package:flutter/material.dart';
import 'package:pay100_pos/onboarding_screen/splash_screen.dart';
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

void main() {
  runApp(const Pay100Shop());
}

class Pay100Shop extends StatefulWidget {
  const Pay100Shop({super.key});

  @override
  State<Pay100Shop> createState() => _Pay100ShopState();
}

class _Pay100ShopState extends State<Pay100Shop> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
