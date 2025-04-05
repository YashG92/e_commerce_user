import 'package:e_commerce_user/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        ///Image
        RoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          height: 60,
          width: 60,
          backgroundColor: dark ? AColors.darkGrey : AColors.light,
          padding: const EdgeInsets.all(TSizes.sm),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        ///Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: ProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              )),

              ///Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(children: [
                          TextSpan(
                              text: e.key,
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: e.value,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ]),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
