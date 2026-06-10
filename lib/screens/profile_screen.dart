import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'address_screen.dart';
import 'admin_products_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(

    appBar: AppBar(
    title: const Text("My Profile"),
    centerTitle: true,
    ),

    body: SingleChildScrollView(

    child: Padding(

    padding: const EdgeInsets.all(20),

    child: Column(

    children: [

    const SizedBox(height: 20),

    CircleAvatar(

    radius: 50,

    backgroundColor:
    const Color(0xFF6C63FF),

    child: const Icon(
    Icons.person,
    size: 60,
    color: Colors.white,
    ),
    ),

    const SizedBox(height: 15),

    const Text(

    "Welcome",

    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),

    const SizedBox(height: 8),

    Text(

    user?.phoneNumber ??
    "No Phone Number",

    style: const TextStyle(
    fontSize: 16,
    color: Colors.grey,
    ),
    ),

    const SizedBox(height: 30),

    Card(

    shape: RoundedRectangleBorder(
    borderRadius:
    BorderRadius.circular(15),
    ),

    child: Column(

    children: [

    ListTile(

    leading: const Icon(
    Icons.location_on,
    color: Colors.red,
    ),

    title:
    const Text("My Address"),

    trailing: const Icon(
    Icons.arrow_forward_ios,
    size: 18,
    ),

    onTap: () {

    Navigator.push(

    context,

    MaterialPageRoute(

    builder: (_) =>
    const AddressScreen(),
    ),
    );
    },
    ),

    const Divider(height: 1),

    ListTile(

    leading: const Icon(
    Icons.receipt_long,
    color: Colors.green,
    ),

    title:
    const Text("My Orders"),

    trailing: const Icon(
    Icons.arrow_forward_ios,
    size: 18,
    ),

    onTap: () {},
    ),

    const Divider(height: 1),

    ListTile(

    leading: const Icon(
    Icons.favorite,
    color: Colors.pink,
    ),

    title:
    const Text("Wishlist"),

    trailing: const Icon(
    Icons.arrow_forward_ios,
    size: 18,
    ),

    onTap: () {},
    ),

    const Divider(height: 1),

    ListTile(

    leading: const Icon(
    Icons.admin_panel_settings,
    color: Colors.blue,
    ),

    title:
    const Text("Admin Panel"),

    trailing: const Icon(
    Icons.arrow_forward_ios,
    size: 18,
    ),

    onTap: () {

    Navigator.push(

    context,

    MaterialPageRoute(

    builder: (_) =>
    const AdminProductsScreen(),
    ),
    );
    },
    ),
    ],
    ),
    ),

    const SizedBox(height: 30),

    SizedBox(

    width: double.infinity,
    height: 50,

    child: ElevatedButton.icon(

    style:
    ElevatedButton.styleFrom(

    backgroundColor:
    Colors.red,

    foregroundColor:
    Colors.white,
    ),

    onPressed: () async {

    await FirebaseAuth.instance
        .signOut();

    Navigator.pushAndRemoveUntil(

    context,

    MaterialPageRoute(

    builder: (_) =>
    const LoginScreen(),
    ),

    (route) => false,
    );
    },

    icon: const Icon(
    Icons.logout,
    ),

    label: const Text(
    "Logout",
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    );


  }
}
