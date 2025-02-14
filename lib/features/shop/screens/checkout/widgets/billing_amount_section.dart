import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

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
            ProductPriceText(price: '4200'),
          ],
        ),
        SizedBox(
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
              price: '640',
              isDiscount: true,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Charges',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ProductPriceText(price: '40'),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ProductPriceText(price: '3500'),
          ],
        ),
      ],
    );
  }
}
