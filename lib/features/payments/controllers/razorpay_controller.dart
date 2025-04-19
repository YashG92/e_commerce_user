import 'package:e_commerce_user/features/shop/controllers/product/order_controller.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../data/services/razoypay_services.dart';


class RazorpayController extends GetxController {
  static RazorpayController get instance => Get.find();

  RazorpayController({required this.totalAmount});

  final double totalAmount;

  late RazorpayService _razorpayService;

  @override
  void onInit() {
    super.onInit();
    final orderController = Get.put(OrderController());
    _razorpayService = RazorpayService(
      onPaymentSuccess: _handlePaymentSuccess,
      onPaymentError: _handlePaymentError,
      onExternalWallet: _handleExternalWallet,
    );
  }

  void startPayment({
    required String name,
    required String description,
    required String email,
    required String contact,
    required double amount,
  }) {
    _razorpayService.openCheckout(
      name: name,
      description: description,
      email: email,
      contact: contact,
      amount: amount,
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    OrderController.instance.processOrder(totalAmount);
    Get.snackbar("Success", "Payment ID: ${response.paymentId}");
    // Save payment in Firestore / API
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Failed", "Error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("External Wallet", "Wallet Name: ${response.walletName}");
  }

  @override
  void onClose() {
    _razorpayService.dispose();
    super.onClose();
  }
}
