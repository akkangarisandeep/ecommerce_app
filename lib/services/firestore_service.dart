import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final CollectionReference products =

  FirebaseFirestore.instance
      .collection('products');

  // Add Product
  Future addProduct(

      String name,
      double price,
      String category,

      ) async {

    return await products.add({

      'name': name,
      'price': price,
      'category': category,
      'createdAt':
      Timestamp.now(),
    });
  }

  // Get Products
  Stream<QuerySnapshot>
  getProducts() {

    return products.snapshots();
  }
}