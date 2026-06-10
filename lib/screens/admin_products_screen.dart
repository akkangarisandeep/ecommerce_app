import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AdminProductsScreen extends StatefulWidget {
  const AdminProductsScreen({super.key});

  @override
  State<AdminProductsScreen> createState() =>
      _AdminProductsScreenState();
}

class _AdminProductsScreenState
    extends State<AdminProductsScreen> {

  final ApiService apiService = ApiService();

  final nameController =
  TextEditingController();

  final priceController =
  TextEditingController();

  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

    appBar: AppBar(
    title: const Text("Admin Products"),
    ),

    floatingActionButton:
    FloatingActionButton(

    child: const Icon(Icons.add),

    onPressed: () {

    showDialog(

    context: context,

    builder: (_) {

    return AlertDialog(

    title:
    const Text("Add Product"),

    content: Column(

    mainAxisSize:
    MainAxisSize.min,

    children: [

    TextField(
    controller:
    nameController,
    decoration:
    const InputDecoration(
    labelText:
    "Product Name",
    ),
    ),

    TextField(
    controller:
    priceController,
    decoration:
    const InputDecoration(
    labelText:
    "Price",
    ),
    ),
    ],
    ),

    actions: [

    TextButton(

    onPressed: () async {

    await apiService
        .addProduct(

    nameController.text,
    priceController.text,
    );

    Navigator.pop(context);

    refresh();
    },

    child:
    const Text("Save"),
    )
    ],
    );
    },
    );
    },
    ),

    body: FutureBuilder(

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

    return ListView.builder(

    itemCount:
    products.length,

    itemBuilder:
    (context, index) {

    final product =
    products[index];

    return Card(

    child: ListTile(

    title: Text(
    product['name'],
    ),

    subtitle: Text(
    "₹${product['price']}",
    ),

    trailing: Row(

    mainAxisSize:
    MainAxisSize.min,

    children: [

    IconButton(

    icon:
    const Icon(
    Icons.edit,
    color:
    Colors.blue,
    ),

    onPressed: () async {

    nameController
        .text =
    product['name'];

    priceController
        .text =
    product['price'];

    showDialog(

    context:
    context,

    builder: (_) {

    return AlertDialog(

    title:
    const Text(
    "Edit Product",
    ),

    content:
    Column(

    mainAxisSize:
    MainAxisSize.min,

    children: [

    TextField(
    controller:
    nameController,
    ),

    TextField(
    controller:
    priceController,
    ),
    ],
    ),

    actions: [

    TextButton(

    onPressed:
    () async {

    await apiService
        .updateProduct(

    product['id']
        .toString(),

    nameController.text,

    priceController.text,
    );

    Navigator.pop(context);

    refresh();
    },

    child:
    const Text(
    "Update",
    ),
    )
    ],
    );
    },
    );
    },
    ),

    IconButton(

    icon:
    const Icon(
    Icons.delete,
    color:
    Colors.red,
    ),

    onPressed:
    () async {

    await apiService
        .deleteProduct(

    product['id']
        .toString(),
    );

    refresh();
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
