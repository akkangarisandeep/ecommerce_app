import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {

  final CollectionReference orders =

  FirebaseFirestore.instance
      .collection('orders');

  Future placeOrder({

    required List cartItems,
    required String address,
    required String flat,

  }) async {

    return await orders.add({

      'cartItems': cartItems,
      'address': address,
      'flat': flat,
      'status': 'Pending',
      'createdAt':
      Timestamp.now(),
    });
  }
}