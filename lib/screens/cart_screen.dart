import 'package:flutter/material.dart';

import 'orders_screen.dart';
import '../services/payment_service.dart';
class CartScreen extends StatelessWidget {

  final List cartItems;
  final PaymentService paymentService =
  PaymentService();
  CartScreen({
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {

    double total = 0;

    for (var item in cartItems) {

      total += double.parse(
        item['price'].toString(),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: Text("My Cart"),
      ),

      body: cartItems.isEmpty

          ? Center(
        child: Text(
          "Cart Empty",
        ),
      )

          : Column(

        children: [

          Expanded(

            child:
            ListView.builder(

              itemCount:
              cartItems.length,

              itemBuilder:
                  (context, index) {

                final item =
                cartItems[index];

                return Card(

                  margin:
                  const EdgeInsets.all(
                      10),

                  child: ListTile(

                    leading:
                    CircleAvatar(

                      child: Icon(
                        Icons.shopping_cart,
                      ),
                    ),

                    title: Text(
                        item['name']),

                    subtitle: Text(
                      "₹${item['price']}",
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(

            padding:
            const EdgeInsets.all(16),

            child: Column(

              children: [

                Text(

                  "Total: ₹$total",

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(

                  width:
                  double.infinity,

                  height: 50,

                  child:
                  ElevatedButton(

                    onPressed: () {

                      paymentService.initPayment(

                        context: context,

                        amount: total,
                      );
                    },

                    child: const Text(
                      "Pay Now",
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}