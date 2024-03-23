import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pay100_pos/payos.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class _AccountState extends State<Account> {
  String displayedExpression = '';
  List<String> transactionData = [];

  @override
  void initState() {
    super.initState();
    // Initial data loading
    loadData();
  }

  void loadData() {
    // Simulating fetching data from an API or database
    // For demonstration, generating random transaction data
    setState(() {
      transactionData = List.generate(10, (index) => generateRandomText());
    });
  }

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
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView.builder(
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
                                  'Paid: ${transactionData[index]}',
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
      ),
    );
  }

  Future<void> _handleRefresh() async {
    // Simulate a delay to mimic data fetching
    await Future.delayed(Duration(seconds: 2));

    // Load new data
    loadData();
  }

  String generateRandomText() {
    final List<String> randomTexts = [
      'Gideon\'s Business',
      'Miracles\'s Business',
      'Brainy\'s Business',
      'Rita\'s Business',
      'Gideon\'s Business',
      'Daniel\'s Business',
      'Hilda\'s Business',
      'Victory\'s Business',
      'Alex\'s Business',
      'Chrisdon\'s Business'
    ];
    final Random random = Random();
    return randomTexts[random.nextInt(randomTexts.length)];
  }
}
