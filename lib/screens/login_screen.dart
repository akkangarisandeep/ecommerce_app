import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'bottom_nav_screen.dart';
class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  // Controllers
  final phoneController =
  TextEditingController();

  final otpController =
  TextEditingController();

  // Firebase Verification ID
  String verificationId = "";

  // OTP Visibility
  bool otpVisible = false;

  bool isLoading = false;

  // Send OTP Function
  Future sendOTP() async {

    setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance
        .verifyPhoneNumber(

      phoneNumber:
      "+91${phoneController.text}",

      verificationCompleted:
          (PhoneAuthCredential credential) async {

      },

      verificationFailed:
          (FirebaseAuthException e) {

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(

          SnackBar(

            backgroundColor: Colors.red,

            content:
            Text(e.message ?? ""),
          ),
        );
      },

      codeSent:
          (String verId, int? resendToken) {

        setState(() {

          verificationId = verId;

          otpVisible = true;

          isLoading = false;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(

          const SnackBar(

            backgroundColor: Colors.green,

            content:
            Text("OTP Sent Successfully"),
          ),
        );
      },

      codeAutoRetrievalTimeout:
          (String verId) {},
    );
  }

  // Verify OTP Function
  Future verifyOTP() async {

    setState(() {
      isLoading = true;
    });

    try {

      PhoneAuthCredential credential =

      PhoneAuthProvider.credential(

        verificationId: verificationId,

        smsCode: otpController.text,
      );

      await FirebaseAuth.instance
          .signInWithCredential(
          credential);

      setState(() {
        isLoading = false;
      });

      // Navigate to Home Screen
      Navigator.pushReplacement(

        context,

        MaterialPageRoute(
          //builder: (_) => HomeScreen(),

          builder: (_) => BottomNavScreen(),
        ),
      );

    } catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          backgroundColor: Colors.red,

          content:
          Text("Invalid OTP"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,

        height: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,

            end: Alignment.bottomRight,

            colors: [

              Color(0xFF6C63FF),

              Color(0xFF8E85FF),

              Color(0xFFF5F7FB),
            ],
          ),
        ),

        child: SafeArea(

          child: Center(

            child: SingleChildScrollView(

              child: Padding(

                padding:
                const EdgeInsets.all(20),

                child: Container(

                  padding:
                  const EdgeInsets.all(25),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(30),

                    boxShadow: [

                      BoxShadow(

                        color:
                        Colors.black.withOpacity(0.1),

                        blurRadius: 15,

                        offset: const Offset(0, 5),
                      )
                    ],
                  ),

                  child: Column(

                    mainAxisSize:
                    MainAxisSize.min,

                    children: [

                      // Logo
                      Container(

                        padding:
                        const EdgeInsets.all(18),

                        decoration: BoxDecoration(

                          color:
                          const Color(0xFFEEEAFE),

                          borderRadius:
                          BorderRadius.circular(20),
                        ),

                        child: const Icon(

                          Icons.shopping_basket,

                          size: 60,

                          color: Color(0xFF6C63FF),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(

                        "Welcome Back 👋",

                        style: TextStyle(

                          fontSize: 28,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(

                        "Login with your mobile number",

                        style: TextStyle(

                          fontSize: 15,

                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Phone Number Field
                      TextField(

                        controller:
                        phoneController,

                        keyboardType:
                        TextInputType.phone,

                        decoration:
                        InputDecoration(

                          filled: true,

                          fillColor:
                          const Color(0xFFF5F7FB),

                          prefixIcon: const Icon(

                            Icons.phone,

                            color:
                            Color(0xFF6C63FF),
                          ),

                          labelText:
                          "Phone Number",

                          hintText:
                          "Enter Mobile Number",

                          border:
                          OutlineInputBorder(

                            borderRadius:
                            BorderRadius.circular(
                                18),

                            borderSide:
                            BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Send OTP Button
                      SizedBox(

                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(

                          style:
                          ElevatedButton.styleFrom(

                            backgroundColor:
                            const Color(0xFF6C63FF),

                            shape:
                            RoundedRectangleBorder(

                              borderRadius:
                              BorderRadius.circular(
                                  18),
                            ),
                          ),

                          onPressed:
                          isLoading
                              ? null
                              : sendOTP,

                          child:
                          isLoading

                              ? const CircularProgressIndicator(

                            color: Colors.white,
                          )

                              : const Text(

                            "Send OTP",

                            style: TextStyle(

                              fontSize: 18,

                              color: Colors.white,

                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // OTP Field
                      if (otpVisible)

                        Column(

                          children: [

                            TextField(

                              controller:
                              otpController,

                              keyboardType:
                              TextInputType.number,

                              decoration:
                              InputDecoration(

                                filled: true,

                                fillColor:
                                const Color(0xFFF5F7FB),

                                prefixIcon:
                                const Icon(

                                  Icons.lock,

                                  color:
                                  Color(0xFF6C63FF),
                                ),

                                labelText: "OTP",

                                hintText:
                                "Enter OTP",

                                border:
                                OutlineInputBorder(

                                  borderRadius:
                                  BorderRadius.circular(
                                      18),

                                  borderSide:
                                  BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            // Verify OTP Button
                            SizedBox(

                              width:
                              double.infinity,

                              height: 55,

                              child:
                              ElevatedButton(

                                style:
                                ElevatedButton.styleFrom(

                                  backgroundColor:
                                  Colors.green,

                                  shape:
                                  RoundedRectangleBorder(

                                    borderRadius:
                                    BorderRadius.circular(
                                        18),
                                  ),
                                ),

                                onPressed:
                                isLoading
                                    ? null
                                    : verifyOTP,

                                child:
                                isLoading

                                    ? const CircularProgressIndicator(

                                  color: Colors.white,
                                )

                                    : const Text(

                                  "Verify OTP",

                                  style: TextStyle(

                                    fontSize: 18,

                                    color: Colors.white,

                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(height: 25),

                      Row(

                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Icon(

                            Icons.security,

                            size: 18,

                            color:
                            Colors.grey.shade600,
                          ),

                          const SizedBox(width: 5),

                          Text(

                            "100% Secure Login",

                            style: TextStyle(

                              color:
                              Colors.grey.shade600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}