import 'package:flutter/material.dart';
import 'dart:convert';
import '../../routes/app_routes.dart';
import '../../core/constants/colors.dart';
import '../../services/auth_services.dart';
import '../../services/group_service.dart';
import '../dashboard/group_dashboard.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  String _otpCode = "";

  void _verifyOtp() async {
    _otpCode = _otpControllers.map((controller) => controller.text).join();

    final response = await AuthService.verifyOTP(_otpCode, widget.phoneNumber);
    if (response.statusCode == 200) {
      //otp to the server verification

      // If you are in a group then go directly to dashboard if not then got to group create
      final response2 = await GroupService.userGroup();

      if (response2.statusCode == 200) {
        final responseData = jsonDecode(response2.body);
        final String groupId = responseData['id'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupDashboard(groupId: groupId),
          ),
        );
      } else {
        print("OTP Verified for ${widget.phoneNumber}");
        Navigator.pushReplacementNamed(context, AppRoutes.createGroup);
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
    }
  }

  void _resendOtp() async {
    //otp logic//
    final response = await AuthService.sendOtp(widget.phoneNumber);
    if (response.statusCode == 201) {
      //otp to the server verification
      print("OTP Resend for ${widget.phoneNumber}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP has been resend to ${widget.phoneNumber}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error resending otp. Try another number")),
      );
    }
    // print("Resend OTP pressed for ${widget.phoneNumber}");
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("OTP resent to ${widget.phoneNumber}")),
    // );
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_focusNodes.isNotEmpty) {
        FocusScope.of(context).requestFocus(_focusNodes[0]);
      }
    });
  }

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: zbGreen,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _goBack,
        ),
        title: Text("OTP Verification", style: TextStyle(color: Colors.white)),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    constraints.maxHeight -
                    (AppBar().preferredSize.height + 48),
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "We've sent a One-Time Password (OTP) to your phone number:",
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.phoneNumber,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      "Please enter the 6-digit code you received via SMS in the box below. This helps us confirm your identity and secure your account.",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      "Enter OTP:",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: constraints.maxWidth / 8,
                          height: 48.0,
                          child: TextField(
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Colors.grey[400]!,
                                ),
                              ),
                              counterText: "",
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (index < 5) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(_focusNodes[index + 1]);
                                }
                              } else if (index > 0) {
                                FocusScope.of(
                                  context,
                                ).requestFocus(_focusNodes[index - 1]);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed:
                          () => {
                            _verifyOtp(),
                            //Navigator.pushNamed(context, AppRoutes.createGroup),
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: zbGreen,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Verify OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      "Didn't receive the OTP?",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "- Check your SMS inbox and spam folder.",
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "- Tap the \"Resend OTP\" button below. Please wait a few moments before requesting a new code.",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    OutlinedButton(
                      onPressed:
                          () => Navigator.pushNamed(context, AppRoutes.login),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: zbGreen),
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                          color: zbGreen,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: _goBack,
                        child: Text(
                          "Wrong phone number? Go back",
                          style: TextStyle(
                            color: zbGreen,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: Colors.grey[600],
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          "This OTP will expire in 10 minutes",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
