import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {

  final Map product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(product['name']),
      ),

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(

              height: 280,

              width: double.infinity,

              color: Colors.white,

              child: Image.asset(
                product['image'],
                fit: BoxFit.contain,
              ),
            ),

            Padding(

              padding:
              const EdgeInsets.all(16),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    product['name'],

                    style: const TextStyle(

                      fontSize: 28,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(

                    "₹${product['price']}",

                    style: const TextStyle(

                      fontSize: 24,

                      color: Colors.green,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Chip(
                    label: Text(
                      product['category'],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(

                    "Description",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(

                    product['description'] ??
                        "Fresh quality product available in Community Store.",

                    style:
                    const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(

        padding:
        const EdgeInsets.all(16),

        child: ElevatedButton(

          style:
          ElevatedButton.styleFrom(

            minimumSize:
            const Size(
                double.infinity,
                55),
          ),

          onPressed: () {},

          child: const Text(
            "Add To Cart",
          ),
        ),
      ),
    );
  }
}