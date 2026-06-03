import 'package:flutter/material.dart';

import '../services/firestore_service.dart';

class AddProductScreen
    extends StatefulWidget {

  @override
  State<AddProductScreen>
  createState() =>
      _AddProductScreenState();
}

class _AddProductScreenState
    extends State<AddProductScreen> {

  final nameController =
  TextEditingController();

  final priceController =
  TextEditingController();

  final categoryController =
  TextEditingController();

  final FirestoreService
  firestoreService =
  FirestoreService();

  Future saveProduct() async {

    await firestoreService
        .addProduct(

      nameController.text,

      double.parse(
          priceController.text),

      categoryController.text,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        Text("Add Product"),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(

              controller:
              nameController,

              decoration:
              InputDecoration(
                labelText:
                "Product Name",
              ),
            ),

            SizedBox(height: 20),

            TextField(

              controller:
              priceController,

              keyboardType:
              TextInputType.number,

              decoration:
              InputDecoration(
                labelText: "Price",
              ),
            ),

            SizedBox(height: 20),

            TextField(

              controller:
              categoryController,

              decoration:
              InputDecoration(
                labelText:
                "Category",
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(

              onPressed:
              saveProduct,

              child: Text(
                "Save Product",
              ),
            )
          ],
        ),
      ),
    );
  }
}