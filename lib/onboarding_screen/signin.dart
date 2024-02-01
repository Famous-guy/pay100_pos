import 'package:flutter/material.dart';
import 'package:pay100_pos/test.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final apiKeyController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  bool _isEmailValid = true;
  bool _isUsernameValid = true;
  bool _isApiKeyValid = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey.shade100,
      //   title: Container(
      //     margin: EdgeInsets.only(top: 10),
      //     child: Image.asset(
      //       'assets/images/100pay.png',
      //       width: 100,
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/100pay.png',
                  width: 100,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Connect to your wallet',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    // // SizedBox(height: 20),
                    // // _buildUsernameField(),
                    // // SizedBox(height: 20),
                    // _buildEmailField(),
                    SizedBox(height: 20),
                    _buildApiKeyField(),
                  ],
                ),
              ),
              // _buildContnueButton(context),

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

                              Future.delayed(Duration(seconds: 5), () {
                                // Check if there is no input after the delay
                                if (apiKeyController.text.isEmpty) {
                                  // Show error message
                                  _showErrorMessage();
                                  _isLoading = false;
                                  return;
                                }

                                // Continue with your logic if there is input
                                _isApiKeyValid =
                                    _validateApiKey(apiKeyController.text);

                                if (_isEmailValid &&
                                    _isUsernameValid &&
                                    _isApiKeyValid) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Pay100(
                                        apikey: apiKeyController.text,
                                      ),
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
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: SizedBox(
              //     height: 48,
              //     width: 136,
              //     child: _isLoading
              //         ? ElevatedButton(
              //             onPressed: () {},
              //             style: ElevatedButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15)),
              //               backgroundColor: Color.fromRGBO(242, 8, 49, 0.7),
              //             ),
              //             child: CircularProgressIndicator(
              //               valueColor:
              //                   AlwaysStoppedAnimation<Color>(Colors.white),
              //             ),
              //           )
              //         : ElevatedButton(
              //             onPressed: () {
              //               setState(() {
              //                 _isLoading = true;

              //                 _isApiKeyValid =
              //                     _validateApiKey(apiKeyController.text);

              //                 if (_isEmailValid &&
              //                     _isUsernameValid &&
              //                     _isApiKeyValid) {
              //                   // Perform your logic here
              //                   // For example, navigate to the next screen
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) => Pay100(
              //                         apikey: apiKeyController.text,
              //                         // emailAddress: emailController.text,
              //                         // userName: usernameController.text,
              //                       ),
              //                     ),
              //                   );
              //                 }
              //               });
              //             },
              //             style: ElevatedButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15)),
              //               backgroundColor: Color.fromRGBO(242, 8, 49, 1),
              //             ),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   'Continue',
              //                   style: TextStyle(
              //                       color: Color.fromRGBO(255, 255, 255, 1),
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 14),
              //                 ),
              //                 Icon(
              //                   Icons.arrow_forward_ios,
              //                   size: 16,
              //                   weight: 100,
              //                   color: Colors.white,
              //                 ),
              //               ],
              //             ),
              //           ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: 'Enter your desired username',
        errorText: _isUsernameValid ? null : 'Username is required',
      ),
      onChanged: (value) {
        setState(() {
          _isUsernameValid = _validateUsername(value);
        });
      },
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: 'Enter your email address',
        errorText: _isEmailValid ? null : 'Please enter a valid email address',
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _isEmailValid = _validateEmail(value);
        });
      },
    );
  }

  Widget _buildApiKeyField() {
    return TextField(
      controller: apiKeyController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: 'Enter your wallet account ID',
        errorText: _isApiKeyValid ? null : 'API key is required',
      ),
      onChanged: (value) {
        setState(() {
          _isApiKeyValid = _validateApiKey(value);
        });
      },
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 48,
        width: 136,
        child: ElevatedButton(
          onPressed: () {
            _isLoading = true;
            setState(() {
              // _isEmailValid = _validateEmail(emailController.text);
              // _isUsernameValid = _validateUsername(usernameController.text);
              _isApiKeyValid = _validateApiKey(apiKeyController.text);

              if (_isEmailValid && _isUsernameValid && _isApiKeyValid) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pay100(
                      apikey: apiKeyController.text,
                      // emailAddress: emailController.text,
                      // userName: usernameController.text,
                    ),
                  ),
                );
              }
            });
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
    );
  }

  bool _validateEmail(String value) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value);
  }

  bool _validateApiKey(String value) {
    return value.isNotEmpty; // Add your additional validation logic here
  }

  bool _validateUsername(String value) {
    return value.isNotEmpty; // Update this logic as per your requirements
  }

  void _showErrorMessage() {
    // Implement the logic to show an error message (Snackbar or other UI element)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: Please input a value.'),
        duration: Duration(seconds: 1),
      ),
    );
    _isLoading = false;
  }
}
