import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../auth/otp_screen.dart';
import '../../core/constants/colors.dart'; //
import "../../services/auth_services.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  void _login() async {
    final response = await AuthService.sendOtp(_phoneController.text);

    if (response.statusCode == 201) {
      // Check if user is in a group and if he is then go straight to dashboard

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(phoneNumber: _phoneController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sending OTP failed. Please try again!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zbGreen, //
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: zbGreen,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Let\'s get you back into your account!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                ),
                SizedBox(height: 24.0),
                Text(
                  'To log in, simply type in your phone number in the box below. Make sure you include your country code (for example, +263 for Zimbabwe).',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                ),
                SizedBox(height: 16.0),
                Text(
                  'On the next screen, you\'ll enter that code to confirm it\'s you and access your account.',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                ),
                SizedBox(height: 24.0),
                Text(
                  'Enter your phone number:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'e.g., +263 7XXXXXXXXX',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: zbGreen, width: 2.0),
                    ),
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    //logic
                    print('Request OTP');
                    _login();
                    //Navigator.pushNamed(context, AppRoutes.otpVerification);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: zbGreen,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Request OTP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Need help? ',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Support');
                      },
                      child: Text(
                        'Support',
                        style: TextStyle(
                          color: zbGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to the app? ',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Sign Up');
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: zbGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Text(
                  'By continuing, you agree to our Terms and Conditions and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
