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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Image.asset(
            'assets/images/100pay.png',
            width: 100,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign In To Your Account',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildUsernameField(),
                    SizedBox(height: 20),
                    _buildEmailField(),
                    SizedBox(height: 20),
                    _buildApiKeyField(),
                  ],
                ),
              ),
              _buildContinueButton(context),
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
        labelText: 'Enter your desired username',
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
        labelText: 'Enter your email address',
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
        labelText: 'Enter your unique API key',
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
            setState(() {
              _isEmailValid = _validateEmail(emailController.text);
              _isUsernameValid = _validateUsername(usernameController.text);
              _isApiKeyValid = _validateApiKey(apiKeyController.text);

              if (_isEmailValid && _isUsernameValid && _isApiKeyValid) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pay100(
                      apikey: apiKeyController.text,
                      emailAddress: emailController.text,
                      userName: usernameController.text,
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
}
