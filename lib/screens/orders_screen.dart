import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderScreen extends StatefulWidget {

  final List cartItems;

  OrderScreen({
    required this.cartItems,
  });

  @override
  State<OrderScreen> createState() =>
      _OrderScreenState();
}

class _OrderScreenState
    extends State<OrderScreen> {

  final TextEditingController
  addressController =
  TextEditingController();

  final TextEditingController
  flatController =
  TextEditingController();

  String paymentMethod =
      "Cash on Delivery";

  String deliverySlot =
      "7AM - 9AM";

  Future<void> placeOrder() async {

    if (addressController.text
        .isEmpty ||
        flatController.text.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            "Please fill all fields",
          ),
        ),
      );

      return;
    }

    try {

      await FirebaseFirestore.instance
          .collection("orders")
          .add({

        "address":
        addressController.text,

        "flat":
        flatController.text,

        "paymentMethod":
        paymentMethod,

        "deliverySlot":
        deliverySlot,

        "cartItems":
        widget.cartItems,
        "status":
        "Pending",
        "timestamp":
        FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            "Order Placed Successfully",
          ),
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            "Error: $e",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Place Order"),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              TextField(

                controller:
                addressController,

                maxLines: 2,

                decoration:
                InputDecoration(

                  labelText: "Address",

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius
                        .circular(12),
                  ),
                ),
              ),

              SizedBox(height: 20),

              DropdownButtonFormField<
                  String>(

                value: paymentMethod,

                decoration:
                InputDecoration(

                  labelText:
                  "Payment Method",

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius
                        .circular(12),
                  ),
                ),

                items: [

                  "Cash on Delivery",

                  "UPI",

                  "Card"
                ].map((method) {

                  return DropdownMenuItem(

                    value: method,

                    child: Text(method),
                  );
                }).toList(),

                onChanged: (value) {

                  setState(() {

                    paymentMethod =
                    value!;
                  });
                },
              ),

              SizedBox(height: 20),

              DropdownButtonFormField<
                  String>(

                value: deliverySlot,

                decoration:
                InputDecoration(

                  labelText:
                  "Delivery Slot",

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius
                        .circular(12),
                  ),
                ),

                items: [

                  "7AM - 9AM",

                  "9AM - 11AM",

                  "5PM - 7PM"
                ].map((slot) {

                  return DropdownMenuItem(

                    value: slot,

                    child: Text(slot),
                  );
                }).toList(),

                onChanged: (value) {

                  setState(() {

                    deliverySlot =
                    value!;
                  });
                },
              ),

              SizedBox(height: 20),

              TextField(

                controller:
                flatController,

                decoration:
                InputDecoration(

                  labelText:
                  "Flat Number",

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius
                        .circular(12),
                  ),
                ),
              ),

              SizedBox(height: 30),

              SizedBox(

                width:
                double.infinity,

                height: 55,

                child: ElevatedButton(

                  onPressed:
                  placeOrder,

                  child: Text(

                    "Place Order",

                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}