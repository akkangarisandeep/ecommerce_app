import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() =>
      _AddressScreenState();
}

class _AddressScreenState
    extends State<AddressScreen> {

  final nameController =
  TextEditingController();

  final phoneController =
  TextEditingController();

  final addressController =
  TextEditingController();

  final cityController =
  TextEditingController();

  final pincodeController =
  TextEditingController();

  Future saveAddress() async {

    final user =
        FirebaseAuth.instance.currentUser;

    if (user == null) return;

    await FirebaseFirestore.instance
        .collection("addresses")
        .doc(user.uid)
        .set({

      "name": nameController.text,

      "phone": phoneController.text,

      "address":
      addressController.text,

      "city": cityController.text,

      "pincode":
      pincodeController.text,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content:
        Text("Address Saved"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text("My Address"),
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller:
              nameController,
              decoration:
              const InputDecoration(
                labelText: "Name",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              phoneController,
              decoration:
              const InputDecoration(
                labelText: "Phone",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              addressController,
              decoration:
              const InputDecoration(
                labelText: "Address",
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              cityController,
              decoration:
              const InputDecoration(
                labelText: "City",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              pincodeController,
              decoration:
              const InputDecoration(
                labelText: "Pincode",
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width:
              double.infinity,

              height: 55,

              child:
              ElevatedButton(

                onPressed:
                saveAddress,

                child:
                const Text(
                  "Save Address",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}