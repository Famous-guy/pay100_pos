import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay100_pos/onboarding_screen/splash_screen1.dart';
// import 'package:pay100_pos/onboarding_screen/splash_screen1.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => InitialOnboarding3())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 8, 49, 1),
      body: SafeArea(
          child: Column(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/100pay_shop.png'),
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Image.asset('assets/images/100pay_shop.png'),
          )),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/images/Subtract.svg',
                  fit: BoxFit.cover,
                )),
          )
        ],
      )),
    );
  }
}
