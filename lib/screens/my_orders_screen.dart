import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrdersScreen
    extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("My Orders"),
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

              final data =
              orders[index].data();

              return Card(

                margin:
                EdgeInsets.all(10),

                child: ListTile(

                  leading: Icon(
                    Icons.shopping_bag,
                  ),

                  title: Text(
                    "Flat: ${data['flat']}",
                  ),

                  subtitle: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                    children: [

                      Text(
                        "Address: ${data['address']}",
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Status: ${data['status']}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight:
                          FontWeight.bold,
                        ),
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
