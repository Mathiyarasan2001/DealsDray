import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:dealsdraypvt/Services/OtpApiServices.dart';

class Otpscreen extends StatefulWidget {
  final String deviceId;
  final String userId;

  const Otpscreen({Key? key, required this.deviceId, required this.userId})
      : super(key: key);

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  late Timer _timer;
  int _start = 120; // OTP timer in seconds
  bool _isResendEnabled = false;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _start = 120;
      _isResendEnabled = false;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendEnabled = true;
        });
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resendOtp() {
    // Add your resend OTP logic here
    print("OTP Resent");
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OTP Verification",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        height: 80,
                        width: 250,
                        child: Text(
                          "We have sent a unique OTP number\nto your mobile +91 6383185407",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: PinCodeTextField(
                    controller: otpController,
                    showCursor: false,
                    keyboardType: TextInputType.phone,
                    appContext: context,
                    length: 4,
                    pinTheme: PinTheme(
                      fieldWidth: 40,
                      borderRadius: BorderRadius.circular(10),
                      shape: PinCodeFieldShape.box,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.grey,
                    ),
                    onChanged: (value) {
                      if (value.length == 4) {
                        otpApiServices().otpApi(
                          otpController.text.toString(),
                          widget.deviceId,
                          widget.userId,
                          context,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _formatTime(_start),
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: _isResendEnabled ? resendOtp : null,
                        child: Text('SEND AGAIN'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
