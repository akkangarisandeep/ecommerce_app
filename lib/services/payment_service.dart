import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {

  late Razorpay razorpay;

  void initPayment({
    required BuildContext context,
    required double amount,
  }) {

    razorpay = Razorpay();

    razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Payment Successful ✅"),
          ),
        );
      },
    );

    razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Payment Failed ❌"),
          ),
        );
      },
    );

    var options = {
      'key': 'rzp_test_SxZuTp7o4I7qm9',
      'amount': (amount * 100).toInt(),
      'name': 'Community Store',
      'description': 'Order Payment',
      'prefill': {
        'contact': '9999999999',
        'email': 'user@email.com'
      }
    };

    razorpay.open(options);
  }

  void dispose() {
    razorpay.clear();
  }
}