import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Card(
      elevation: 5,
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? AColors.darkerGrey : AColors.lightContainer),
        child: Row(
          children: [
            /// Thumbnail
            RoundedContainer(
              height: 120,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? AColors.dark : AColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: RoundedImage(
                      imageUrl: ImageStrings.productImage1,
                      applyImageRadius: true,
                    ),
                  ),

                  ///Sale
                  Positioned(
                    top: 8,
                    child: RoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: AColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AColors.black),
                      ),
                    ),
                  ),

                  /// Favorite Icon Button

                  Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),

            ///Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitleText(
                          title: 'Green Nike half sleeve tshirts',
                          smallSize: true,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        BrandTitleWithVerifiedIcon(title: 'Nike'),
                      ],
                    ),

                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Pricing
                        Flexible(child: ProductPriceText(price: '2500 - 5000')),

                        ///Add to Cart
                        Container(
                          decoration: BoxDecoration(
                            color: AColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: SizedBox(
                              width: TSizes.iconLg *1.2,
                              height: TSizes.iconLg*1.2,
                              child: Center(child: Icon(Iconsax.add, color: AColors.white,))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}