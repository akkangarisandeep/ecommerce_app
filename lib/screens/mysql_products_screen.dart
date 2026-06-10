import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MysqlProductsScreen extends StatefulWidget {
  const MysqlProductsScreen({super.key});

  @override
  State<MysqlProductsScreen> createState() =>
      _MysqlProductsScreenState();
}

class _MysqlProductsScreenState
    extends State<MysqlProductsScreen> {

  final ApiService apiService = ApiService();

  String searchText = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("MySQL Products"),
      ),

      body: Column(

        children: [

          Padding(

            padding: const EdgeInsets.all(12),

            child: TextField(

              decoration: InputDecoration(

                hintText: "Search Product",

                prefixIcon:
                const Icon(Icons.search),

                border: OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),

              onChanged: (value) {

                setState(() {

                  searchText =
                      value.toLowerCase();
                });
              },
            ),
          ),

          Expanded(

            child: FutureBuilder(

              future:
              apiService.getProducts(),

              builder:
                  (context, snapshot) {

                if (!snapshot.hasData) {

                  return const Center(

                    child:
                    CircularProgressIndicator(),
                  );
                }

                List products =
                snapshot.data as List;

                final filteredProducts =

                products.where((product) {

                  return product['name']
                      .toString()
                      .toLowerCase()
                      .contains(searchText);

                }).toList();

                if (filteredProducts
                    .isEmpty) {

                  return const Center(

                    child: Text(
                      "No Products Found",
                    ),
                  );
                }

                return ListView.builder(

                  itemCount:
                  filteredProducts.length,

                  itemBuilder:
                      (context, index) {

                    final product =
                    filteredProducts[index];

                    return Card(

                      margin:
                      const EdgeInsets.all(
                          8),

                      child: ListTile(

                        leading:
                        const CircleAvatar(

                          child: Icon(
                            Icons.shopping_bag,
                          ),
                        ),

                        title: Text(
                          product['name'],
                        ),

                        subtitle: Text(
                          "₹${product['price']}",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}