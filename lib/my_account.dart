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
    String label = 'Gideons Business';
    String id = 'RT123456';
    String time = '2:00pm';
    int amount = 20000;
    bool status = true;
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
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'space_grotesk'),
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/success.png',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Text(
                                'Paid: $label',
                                style: TextStyle(
                                  color: Color(0xff6B7280),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'space_grotesk',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                'ID: $id',
                                style: TextStyle(
                                  color: Color(0xff6B7280),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: 'space_grotesk',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Text(
                                '$time',
                                style: TextStyle(
                                  color: Color(0xff9CA3AF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: 'space_grotesk',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: Text(
                            '+${amount}\$Pay',
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: 'space_grotesk',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: Text(
                            status ? 'Successful' : 'Failed',
                            style: TextStyle(
                              color: status
                                  ? Color(0xff22C55E)
                                  : Color(0xffEF4444),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: 'space_grotesk',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
