import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/pricing_calculator.dart';
import 'package:flutter/material.dart';


class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key, required this.total, required this.subTotal, required this.shippingCost});

  final double total;
  final double subTotal;
  final double shippingCost;

  @override
  Widget build(BuildContext context) {
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
            ProductPriceText(price: shippingCost.toStringAsFixed(2) ),
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
            ProductPriceText(price: '${TPricingCalculator.calculateTotalPrice(subTotal, 'India',shippingCost)}'),
          ],
        ),
      ],
    );
  }
}
