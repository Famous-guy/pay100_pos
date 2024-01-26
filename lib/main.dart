import 'package:flutter/material.dart';
import 'package:pay100_pos/onboarding_screen/splash_screen.dart';
import 'package:pay100_pos/test.dart';

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
