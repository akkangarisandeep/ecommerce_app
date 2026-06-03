import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'my_orders_screen.dart';
import 'address_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [

              Color(0xFF6C63FF),
              Color(0xFFF5F7FB),
            ],
          ),
        ),

        child: SafeArea(

          child: Column(

            children: [

              const SizedBox(height: 25),

              const CircleAvatar(

                radius: 55,

                backgroundColor: Colors.white,

                child: Icon(

                  Icons.person,

                  size: 60,

                  color: Color(0xFF6C63FF),
                ),
              ),

              const SizedBox(height: 15),

              const Text(

                "Community Store User",

                style: TextStyle(

                  fontSize: 24,

                  fontWeight: FontWeight.bold,

                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 5),

              Text(

                user?.phoneNumber ?? "No Phone Number",

                style: const TextStyle(

                  fontSize: 16,

                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 25),

              Expanded(

                child: Container(

                  width: double.infinity,

                  decoration: const BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.only(

                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),

                  child: Padding(

                    padding: const EdgeInsets.all(20),

                    child: Column(

                      children: [

                        buildTile(

                          context,

                          Icons.receipt_long,

                          "My Orders",

                              () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    MyOrdersScreen(),
                              ),
                            );
                          },
                        ),

                        buildTile(

                          context,

                          Icons.location_on,

                          "My Address",

                              () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                const AddressScreen(),
                              ),
                            );
                          },
                        ),

                        buildTile(

                          context,

                          Icons.settings,

                          "Settings",

                              () {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              const SnackBar(

                                content: Text(
                                  "Settings Coming Soon",
                                ),
                              ),
                            );
                          },
                        ),

                        buildTile(

                          context,

                          Icons.help,

                          "Help & Support",

                              () {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              const SnackBar(

                                content: Text(
                                  "Support Coming Soon",
                                ),
                              ),
                            );
                          },
                        ),

                        buildTile(

                          context,

                          Icons.logout,

                          "Logout",

                              () async {

                            await FirebaseAuth.instance
                                .signOut();

                            Navigator.pushAndRemoveUntil(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    LoginScreen(),
                              ),

                                  (route) => false,
                            );
                          },
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
    );
  }

  Widget buildTile(

      BuildContext context,

      IconData icon,

      String title,

      VoidCallback onTap,
      ) {

    return Card(

      elevation: 4,

      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      shape: RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor:
          const Color(0xFFEEEAFE),

          child: Icon(

            icon,

            color:
            const Color(0xFF6C63FF),
          ),
        ),

        title: Text(

          title,

          style: const TextStyle(

            fontWeight:
            FontWeight.bold,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),

        onTap: onTap,
      ),
    );
  }
}