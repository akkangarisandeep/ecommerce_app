import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {

  final List wishlistItems;

  const WishlistScreen({
    super.key,
    required this.wishlistItems,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Wishlist"),
      ),

      body: wishlistItems.isEmpty

          ? const Center(
        child: Text(
          "No Wishlist Items",
        ),
      )

          : ListView.builder(

        itemCount: wishlistItems.length,

        itemBuilder: (context, index) {

          final item =
          wishlistItems[index];

          return Card(

            margin:
            const EdgeInsets.all(10),

            child: ListTile(

              leading:
              const Icon(
                Icons.favorite,
                color: Colors.red,
              ),

              title: Text(
                item['name']?.toString() ?? 'No Name',
              ),

              subtitle: Text(
                "₹${item['price']?.toString() ?? '0'}",

              ),
            ),
          );
        },
      ),
    );
  }
}