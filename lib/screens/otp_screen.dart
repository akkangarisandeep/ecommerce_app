import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

import 'bottom_nav_screen.dart';

class OtpScreen extends StatefulWidget {

  final String verificationId;

  const OtpScreen({
    required this.verificationId,
  });

  @override
  State<OtpScreen> createState() =>
      _OtpScreenState();
}

class _OtpScreenState
    extends State<OtpScreen> {

  final otpController =
  TextEditingController();

  Future<void> verifyOTP() async {

    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(
      verificationId:
      widget.verificationId,

      smsCode:
      otpController.text.trim(),
    );

    await FirebaseAuth.instance
        .signInWithCredential(
        credential);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const BottomNavScreen(),
      ),
          (route) => false,
    );;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(title: Text("OTP")),

      body: Padding(
        padding:
        const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller:
              otpController,

              keyboardType:
              TextInputType.number,

              decoration:
              InputDecoration(
                labelText:
                "Enter OTP",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: verifyOTP,
              child: Text("Verify"),
            )
          ],
        ),
      ),
    );
  }
}