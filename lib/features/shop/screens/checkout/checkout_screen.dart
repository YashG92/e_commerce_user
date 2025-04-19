import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_user/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:e_commerce_user/utils/helper/pricing_calculator.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../payments/controllers/razorpay_controller.dart';
import '../../controllers/product/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final checkoutController = CheckoutController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Obx(() {
      final subTotal = cartController.totalCartSalePrice.value;
      final total = cartController.totalCartPrice.value;
      final shippingCost = checkoutController.settings.value.freeShippingLimit != null &&
          checkoutController.settings.value.freeShippingLimit! < subTotal
          ? 0.0
          : checkoutController.settings.value.shippingCost;
      final totalAmount = TPricingCalculator.calculateTotalPrice(
          subTotal, 'India', shippingCost);

      return Scaffold(
        appBar: CustomAppbar(
          showBackArrow: true,
          title: Text(
            'Order Summary',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const CartItems(showAddRemoveButton: false),
                const SizedBox(height: TSizes.spaceBtwSections),
                const CouponCode(),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Billing Section
                RoundedContainer(
                  padding: const EdgeInsets.all(TSizes.sm * 1.5),
                  showBorder: true,
                  backgroundColor: dark ? Colors.black : Colors.white,
                  child: Column(
                    children: [
                      BillingAmountSection(
                          total: total,
                          subTotal: subTotal,
                          shippingCost: shippingCost),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const BillingPaymentSection(),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      const BillingAddressSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace / 2.5),
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: subTotal > 0
                  ? () {
                final razorpayController =
                Get.put(RazorpayController(totalAmount: totalAmount));
                razorpayController.startPayment(
                  name: "VY Store",
                  description: "Test Payment",
                  email: "customer@email.com",
                  contact: "9999999999",
                  amount: totalAmount,
                );
              }
                  : () => Loaders.warningSnackBar(
                  title: 'Empty Cart', message: 'Your cart is empty'),
              child: Text('Checkout ₹$totalAmount'),
            ),
          ),
        ),
      );
    });
  }

}
