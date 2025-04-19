import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/pricing_calculator.dart';
import 'package:flutter/material.dart';

import '../../../controllers/product/cart_controller.dart';
import '../../../controllers/product/checkout_controller.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final checkoutController = CheckoutController.instance;
    final subTotal = cartController.totalCartSalePrice.value;
    final total = cartController.totalCartPrice.value;
    return Column(
      children: [
        ///subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SubTotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ProductPriceText(price: '$total'),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ProductPriceText(
              price: '${TPricingCalculator.calculateDiscountAmount(total, subTotal)}',
              isDiscount: true,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Charges',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ProductPriceText(price: checkoutController.settings.value.shippingCost.toString()),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ProductPriceText(price: '${TPricingCalculator.calculateTotalPrice(subTotal, 'India')}'),
          ],
        ),
      ],
    );
  }
}
