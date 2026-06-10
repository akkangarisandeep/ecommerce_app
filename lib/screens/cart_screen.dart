import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CartScreen extends StatelessWidget {

  final List cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {

    final ApiService apiService = ApiService();

    double total = 0;

    for (var item in cartItems) {
      total += double.parse(
        item['price'].toString(),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Cart"),
      ),

      body: cartItems.isEmpty

          ? const Center(
        child: Text(
          "Cart Empty",
        ),
      )

          : Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: cartItems.length,

              itemBuilder: (context, index) {

                final item = cartItems[index];

                return Card(

                  margin: const EdgeInsets.all(10),

                  child: ListTile(

                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.shopping_cart,
                      ),
                    ),

                    title: Text(
                      item['name'],
                    ),

                    subtitle: Text(
                      "₹${item['price']}",
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(

            padding: const EdgeInsets.all(16),

            child: Column(

              children: [

                Text(

                  "Total: ₹$total",

                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(

                  width: double.infinity,

                  height: 50,

                  child: ElevatedButton(

                    onPressed: () async {

                      for (var item in cartItems) {

                        await apiService.saveOrder(

                          item['name'],

                          item['price'].toString(),
                        );
                      }

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(

                          backgroundColor:
                          Colors.green,

                          content: Text(
                            "Order Saved Successfully 🎉",
                          ),
                        ),
                      );
                    },

                    child: const Text(
                      "Checkout",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}