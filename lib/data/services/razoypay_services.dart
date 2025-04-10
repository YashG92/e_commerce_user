import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  late Razorpay _razorpay;
  final void Function(PaymentSuccessResponse) onPaymentSuccess;
  final void Function(PaymentFailureResponse) onPaymentError;
  final void Function(ExternalWalletResponse) onExternalWallet;

  RazorpayService({
    required this.onPaymentSuccess,
    required this.onPaymentError,
    required this.onExternalWallet,
  }) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onPaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternalWallet);
  }

  void openCheckout({
    required String name,
    required String description,
    required String email,
    required String contact,
    required double amount,
  }) {
    final options = {
      'key': 'rzp_test_YY1XEwxhcVWOkh',
      'amount': (amount * 100).toInt(),
      'name': name,
      'description': description,
      'prefill': {'contact': contact, 'email': email},
      'currency': 'INR',
    };

    _razorpay.open(options);
  }

  void dispose() {
    _razorpay.clear();
  }
}
