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
  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        ///Image
        RoundedImage(
          imageUrl: ImageStrings.productImage1,
          height: 60,
          width: 60,
          backgroundColor:dark ? AColors.darkGrey : AColors.light ,
          padding: EdgeInsets.all(TSizes.sm),
        ),
        SizedBox(width: TSizes.spaceBtwItems,),

        ///Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(child: ProductTitleText(title: 'Green Air Shoes',maxLines: 1,)),

              ///Attributes
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: 'Color ',style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green',style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ',style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Uk 8',style: Theme.of(context).textTheme.bodyLarge),
                  ]
              ))
            ],
          ),
        )
      ],
    );
  }
}
