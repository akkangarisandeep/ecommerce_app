import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MysqlOrdersScreen extends StatefulWidget {
  const MysqlOrdersScreen({super.key});

  @override
  State<MysqlOrdersScreen> createState() =>
      _MysqlOrdersScreenState();
}

class _MysqlOrdersScreenState
    extends State<MysqlOrdersScreen> {

  final ApiService apiService = ApiService();

  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Orders"),
      ),

      body: FutureBuilder<List<dynamic>>(

        future: apiService.getOrders(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List orders = snapshot.data!;

          if (orders.isEmpty) {
            return const Center(
              child: Text("No Orders Found"),
            );
          }

          return ListView.builder(

            itemCount: orders.length,

            itemBuilder: (context, index) {

              final order = orders[index];

              return Card(

                margin: const EdgeInsets.all(10),

                child: ListTile(

                  leading: const Icon(
                    Icons.receipt_long,
                    color: Colors.green,
                  ),

                  title: Text(
                    order['product_name'],
                  ),

                  subtitle: Text(
                    "₹${order['price']}",
                  ),

                  trailing: IconButton(

                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),

                    onPressed: () async {

                      await apiService.deleteOrder(
                        order['id'],
                      );

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(
                          content: Text(
                            "Order Deleted",
                          ),
                        ),
                      );

                      refresh();
                    },
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