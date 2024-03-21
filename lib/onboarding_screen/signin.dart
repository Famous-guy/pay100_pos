import 'package:flutter/material.dart';
import 'package:pay100_pos/provider/auth.dart';
import 'package:pay100_pos/test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final apiKeyController = TextEditingController();
  bool _isApiKeyValid = true;
  bool _isLoading = false;
  bool _isDarkMode = false; // Track the current theme mode

  @override
  Widget build(BuildContext context) {
    String imageAssetPath = _isDarkMode
        ? 'assets/images/100Paywhite.png'
        : 'assets/images/100Payblack.png';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      value: _isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          _isDarkMode = value;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    imageAssetPath,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Connect To Your wallet',
                        style: TextStyle(
                          fontFamily: 'space_grotesk',
                          fontSize: 20,
                          color: _isDarkMode ? Colors.white : Color(0xff4B5563),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter your wallet account ID',
                        style: TextStyle(
                          fontFamily: 'space_grotesk',
                          fontSize: 14,
                          color: _isDarkMode ? Colors.white : Color(0xff344054),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      _buildApiKeyField(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 48,
                    width: 136,
                    child: _isLoading
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
                            ),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isLoading = true;

                                Future.delayed(Duration(seconds: 5), () async {
                                  if (apiKeyController.text.isEmpty) {
                                    _showErrorMessage();
                                    _isLoading = false;
                                    return;
                                  }

                                  _isApiKeyValid =
                                      _validateApiKey(apiKeyController.text);

                                  if (_isApiKeyValid) {
                                    // Save API key to local storage
                                    await saveApiKey(apiKeyController.text);

                                    // Navigate to the next screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pay100(),
                                      ),
                                    );
                                  }

                                  _isLoading = false;
                                });
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Color.fromRGBO(242, 8, 49, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  weight: 100,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildApiKeyField() {
    return TextField(
      controller: apiKeyController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE5E7EB),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'eg: 293391',
        hintStyle: TextStyle(
          color: Color(0xffD1D5DB),
        ),
        // errorStyle: TextStyle(
        //   color: _isApiKeyValid ? Colors.green : Colors.red,
        // ),
        errorText: _isApiKeyValid
            ? null
            : 'Sorry, We cannot find an account with that wallet ID',
      ),
      onChanged: (value) {
        setState(() {
          _isApiKeyValid = _validateApiKey(value);
        });
      },
    );
  }

  bool _validateApiKey(String value) {
    return value.startsWith('LIVE;PK;ey');
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: Please input a value.'),
        duration: Duration(seconds: 1),
      ),
    );
    _isLoading = false;
  }

  Future<void> saveApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiKey', apiKey);
    print('API key saved successfully: $apiKey');
  }
}
