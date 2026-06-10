import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  // Get Products
  Future<List<dynamic>> getProducts() async {

    final response = await http.get(

      Uri.parse(
        "http://192.168.1.33/community_store_api/get_products.php",
      ),
    );

    return jsonDecode(response.body);
  }

  // Save Order
  Future saveOrder(String name, String price) async {

    final response = await http.post(

      Uri.parse(
        "http://192.168.1.33/community_store_api/save_order.php",
      ),

      body: {
        "product_name": name,
        "price": price,
      },
    );

    print("Save Order Response:");
    print(response.body);
  }

  // Get Orders
  Future<List<dynamic>> getOrders() async {

    final response = await http.get(

      Uri.parse(
        "http://192.168.1.33/community_store_api/get_orders.php",
      ),
    );

    return jsonDecode(response.body);
  }

  Future deleteOrder(String id) async {

    await http.post(

      Uri.parse(
        "http://192.168.1.33/community_store_api/delete_order.php",
      ),

      body: {
        "id": id,
      },
    );
  }

  Future saveAddress(
      String name,
      String mobile,
      String address,
      ) async {

    await http.post(

      Uri.parse(
        "http://192.168.1.33/community_store_api/save_address.php",
      ),

      body: {

        "name": name,
        "mobile": mobile,
        "address": address,
      },
    );
  }

  Future getAddress() async {

    final response = await http.get(

      Uri.parse(
        "http://192.168.1.33/community_store_api/get_address.php",
      ),
    );

    return jsonDecode(response.body);
  }
  Future addProduct(
      String name,
      String price,
      ) async {

    await http.post(

      Uri.parse(
        "http://192.168.1.33/community_store_api/add_product.php",
      ),

      body: {

        "name": name,
        "price": price,
      },
    );
  }
  Future deleteProduct(String id) async {

    await http.post(

      Uri.parse(
        "http://192.168.1.33/community_store_api/delete_product.php",
      ),

      body: {
        "id": id,
      },
    );
  }
  Future updateProduct(
      String id,
      String name,
      String price,
      ) async {

    await http.post(

      Uri.parse(
        "http://192.168.1.33/community_store_api/update_product.php",
      ),

      body: {

        "id": id,
        "name": name,
        "price": price,
      },
    );
  }
}