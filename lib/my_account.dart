import 'package:flutter/material.dart';
import 'package:pay100_pos/test.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    String label = 'Market Square bsiness';
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pay100(),
                  ));
            },
            icon: ImageIcon(
              AssetImage('assets/images/back.png'),
            ),
          ),
          titleTextStyle: TextStyle(
              color: Color(0xff4B5563),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'space_grotesk'),
          title: Text('Transaction History'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
          child: ListView(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/success.png',
                          ),
                          Text(
                            'Paid $label',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
