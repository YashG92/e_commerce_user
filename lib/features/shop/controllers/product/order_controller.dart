import 'package:e_commerce_user/common/widgets/loaders/full_screen_loader.dart';
import 'package:e_commerce_user/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_user/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_user/navigation_menu.dart';
import 'package:e_commerce_user/utils/constants/enums.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/orders/order_repository.dart';
import '../../../personaliztion/controller/address_controller.dart';
import '../../models/order_model.dart';
import 'checkout_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    FullScreenLoader.openLoadingDialog(
        'Placing your Order', ImageStrings.loadingAnimation);

    final userId = AuthenticationRepository.instance.authUser.uid;
    if (userId.isEmpty) return;

    final newOrder = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now().add(const Duration(days: 5)),
        items: cartController.cartItems.toList());

    await orderRepository.placeOrder(newOrder, userId);

    cartController.clearCart();

    Get.off(() => SuccessScreen(
        image: ImageStrings.successGif,
        title: 'Payment Success!',
        subTitle: 'Your order will be placed soon!',onPressed: ()=>Get.offAll(()=> const NavigationMenu()),),
    );
  }
}
