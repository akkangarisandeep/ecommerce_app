import 'package:flutter/material.dart';
import '../services/api_service.dart';

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

  final mobileController =
  TextEditingController();

  final addressController =
  TextEditingController();

  final ApiService apiService =
  ApiService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Delivery Address"),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller:
              nameController,

              decoration:
              const InputDecoration(

                labelText:
                "Full Name",
              ),
            ),

            const SizedBox(height: 15),

            TextField(

              controller:
              mobileController,

              decoration:
              const InputDecoration(

                labelText:
                "Mobile Number",
              ),
            ),

            const SizedBox(height: 15),

            TextField(

              controller:
              addressController,

              maxLines: 3,

              decoration:
              const InputDecoration(

                labelText:
                "Address",
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () async {

                  await apiService
                      .saveAddress(

                    nameController.text,

                    mobileController.text,

                    addressController.text,
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    const SnackBar(

                      content: Text(
                        "Address Saved ✅",
                      ),
                    ),
                  );
                },

                child: const Text(
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