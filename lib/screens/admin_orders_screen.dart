import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminOrdersScreen
    extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Admin Orders"),
      ),

      body: StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection("orders")
            .snapshots(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {

            return Center(
              child:
              CircularProgressIndicator(),
            );
          }

          final orders =
              snapshot.data!.docs;

          if (orders.isEmpty) {

            return Center(
              child: Text(
                "No Orders",
              ),
            );
          }

          return ListView.builder(

            itemCount: orders.length,

            itemBuilder: (context, index) {

              final order =
              orders[index];

              final data =
              order.data();

              return Card(

                margin:
                EdgeInsets.all(10),

                child: Padding(

                  padding:
                  EdgeInsets.all(12),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                    children: [

                      Text(
                        "Flat: ${data['flat']}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Address: ${data['address']}",
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Payment: ${data['paymentMethod']}",
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Slot: ${data['deliverySlot']}",
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Status: ${data['status']}",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      DropdownButton<String>(

                        value:
                        data['status'],

                        items: [

                          "Pending",

                          "Accepted",

                          "Out for Delivery",

                          "Delivered"

                        ].map((status) {

                          return DropdownMenuItem(

                            value: status,

                            child: Text(status),
                          );
                        }).toList(),

                        onChanged: (value)
                        async {

                          await FirebaseFirestore
                              .instance
                              .collection(
                              "orders")
                              .doc(order.id)
                              .update({

                            "status":
                            value,
                          });
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}