import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_user/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_user/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_user/navigation_menu.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:e_commerce_user/utils/helper/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartSalePrice.value;
    final total = cartController.totalCartPrice.value;
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'India');
    final dark = HelperFunctions.isDarkMode(context);
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
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CartItems(showAddRemoveButton: false),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///coupons
              CouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Billing Section
              RoundedContainer(
                padding: const EdgeInsets.all(TSizes.sm * 1.5),
                showBorder: true,
                backgroundColor: dark ? Colors.black : Colors.white,
                child: const Column(
                  children: [
                    ///pricing
                    BillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///payment methods
                    BillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),

                    ///address
                    BillingAddressSection(),
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
              onPressed: () => Get.to(() => SuccessScreen(
                    image: ImageStrings.successGif,
                    title: 'Payment Success!',
                    subTitle: 'Your order will be placed soon!',
                    onPressed: () => Get.offAll(() => NavigationMenu()),
                  )),
              child: Text('Checkout ₹$totalAmount')),
        ),
      ),
    );
  }
}
