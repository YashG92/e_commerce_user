import 'package:e_commerce_user/common/widgets/texts/brand_title_text.dart';
import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/common/widgets/texts/product_title_text.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Title

        //Text('Nike',style: Theme.of(context).textTheme.headlineSmall,),
        BrandTitleWithVerifiedIcon(title: 'Nike',isLarge: true,),
        ProductTitleText(title: 'Green Air Shoes'),
        SizedBox(height: TSizes.spaceBtwItems,),

        ///Price & Sale Price

        Row(
          children: [
            //sale
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: Colors.green.withValues(alpha: 0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: AColors.black),
              ),
            ),

            SizedBox(width: TSizes.spaceBtwItems,),

            ProductPriceText(price: '3,199',lineThrough: true,isLarge: true,),
            SizedBox(width: TSizes.spaceBtwItems,),

            ProductPriceText(price: '1,375',isLarge: true,),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ProductTitleText(
          title:
          'The name says it all, the right size slightly snugs the body leaving enough room for comfort inthe sleeves and waist',
          maxLines: 4,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ///Stock Status
        ///Brand
      ],
    );
  }
}
