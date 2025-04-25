import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_user/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/checkout_screen.dart';
import 'package:e_commerce_user/features/shop/screens/global_search_screen.dart';

import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Obx(
        () {
          final emptyWidget = AnimationLoaderWidget(
            text: 'Oops!, Cart is Empty',
            animation: ImageStrings.loadingAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.to(() => const GlobalSearchScreen()),
          );

          return controller.cartItems.isEmpty
              ? emptyWidget
              : const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    child: CartItems(),
                  ),
                );
        },
      ),
      bottomNavigationBar: Obx(() {
        return controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  top: TSizes.defaultSpace,
                ),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const CheckoutScreen()),
                    child: Text(
                        'Checkout ₹${controller.totalCartSalePrice.value}'),
                  ),
                ),
              );
      }),
    );
  }
}
