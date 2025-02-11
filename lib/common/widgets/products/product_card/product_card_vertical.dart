import 'package:e_commerce_user/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductReviewScreen()),
      child: Card(
        elevation: 5,
        child: Container(

          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? Theme.of(context).scaffoldBackgroundColor : AColors.white,
          ),
          child: Column(
            children: [
              ///Image favBtn DiscountTag
              RoundedContainer(
                height: 172,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? Theme.of(context).scaffoldBackgroundColor : AColors.light,
                child: Stack(
                  children: [
                    ///Thumbnail Image
                    Center(
                      child: RoundedImage(
                        imageUrl: ImageStrings.productImage9,
                        applyImageRadius: true,
                      ),
                    ),

                    ///Sale Tag
                    Positioned(
                      top: 10,
                      child: RoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: Colors.red.withValues(alpha: 0.8),
                        padding: EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.apply(color: AColors.black),
                        ),
                      ),
                    ),

                    ///Fav Icon Button
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(icon: Iconsax.heart5,color: Colors.red,),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              ///Details

              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(
                      title: 'Nike Air Shoes',
                      smallSize: true,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    BrandTitleWithVerifiedIcon(title: 'Nike',),
                    ///Spacer mayvbe


                  ],
                ),
              ),
              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    child: ProductPriceText(price: '4999',isLarge: false,),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color:dark ? Colors.blue:AColors.black,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(TSizes.cardRadiusMd),bottomRight: Radius.circular(TSizes.cardRadiusMd))
                    ),
                    child: SizedBox(
                        height: TSizes.iconLg,
                        width: TSizes.iconLg,
                        child: Icon(Iconsax.add, color: AColors.white,)),
                  ),

                ],),
            ],
          ),
        ),
      ),
    );
  }
}