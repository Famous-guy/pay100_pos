import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:pay100_pos/onboarding_screen/signin.dart';
import 'package:pay100_pos/onboarding_screen/splash_screen4.dart';

class InitialOnboarding2 extends StatefulWidget {
  const InitialOnboarding2({super.key});

  @override
  State<InitialOnboarding2> createState() => _InitialOnboarding2State();
}

class _InitialOnboarding2State extends State<InitialOnboarding2> {
  // int currentPage = 1; // Add a field to track the current carousel page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/1003.png')),
                  // Your existing carousel widget should be here
                ],
              ),
            ),
            // CarouselIndicator(
            //   count: 4, // Number of items in your carousel
            //   index: 2,
            //   color: Colors.grey,
            //   activeColor: Colors.red,
            // ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'The Future Of Making Payments',
                    style: TextStyle(
                        color: Color.fromRGBO(242, 8, 49, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod.",
                        style: TextStyle(
                            color: Color.fromRGBO(156, 163, 175, 1),
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ),
                  // ... Your existing Text and Padding widgets
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ));
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: Color.fromRGBO(75, 85, 99, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                side: BorderSide(
                                    strokeAlign: 2,
                                    width: 1.0,
                                    color: Color.fromRGBO(75, 85, 99, 1)),
                                // fixedSize: ,
                                elevation: 0,
                                // rgba(229, 231, 235, 1)
                                // rgba(229, 231, 235, 1)
                                // rgba(75, 85, 99, 1)
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InitialOnboarding4(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                // side: BorderSide(
                                //     strokeAlign: 2,
                                //     width: 1.0,
                                //     color: Color.fromRGBO(75, 85, 99, 1)),
                                // fixedSize: ,
                                elevation: 0,
                                // rgba(229, 231, 235, 1)
                                // rgba(229, 231, 235, 1)
                                // rgba(75, 85, 99, 1)
                                backgroundColor: Color.fromRGBO(242, 8, 49, 1)),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
