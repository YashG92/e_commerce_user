import 'package:e_commerce_user/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_user/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:e_commerce_user/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/product_detail.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/enums.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_detail/widgets/product_add_to_cart_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final salePercentage = productController.calculateSalePercentage(
        product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {precacheImage(NetworkImage(product.thumbnail), Get.context!);

      Get.to(
            () => ProductDetailScreen(product: product),
        //transition: Transition.cupertino, // Smohest built-in transition
        duration: const Duration(milliseconds: 500), // Optimal duration
        curve: Curves.fastOutSlowIn, // Best curve for smoothness
        popGesture: true, // Enable iOS-style swipe back
      );},
      child: Card(
        elevation: 5,
        shadowColor: dark ? AColors.darkerGrey : Colors.black,
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark
                ? Theme.of(context).scaffoldBackgroundColor
                : AColors.white,
          ),
          child: Column(
            children: [
              ///Image favBtn DiscountTag
              RoundedContainer(
                height: 172,
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: dark
                    ? Theme.of(context).scaffoldBackgroundColor
                    : AColors.light,
                child: Stack(
                  children: [
                    ///Thumbnail Image
                    Center(
                      child: Hero(
                        tag: product.id,
                        child: RoundedImage(
                          imageUrl: product.thumbnail,
                          applyImageRadius: true,
                          isNetworkImage: true,
                        ),
                      ),
                    ),

                    ///Sale Tag
                    if (salePercentage != null)
                      Positioned(
                        top: 10,
                        child: RoundedContainer(
                          radius: TSizes.sm,
                          backgroundColor: Colors.red.withValues(alpha: 0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: Text(
                            '$salePercentage%',
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
                      child: FavoriteIcon(productId: product.id,),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              ///Details

              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(
                      title: product.title,
                      smallSize: true,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    BrandTitleWithVerifiedIcon(
                      title: product.brand!.name,
                    ),

                    ///Spacer mayvbe
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Price
                  Flexible(
                    child: Column(
                      children: [
                        if (product.productType ==
                                ProductType.single.toString() &&
                            product.salePrice > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: TSizes.sm),
                            child: Text(
                              product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: ProductPriceText(
                            price: productController.getProductPrice(product),
                            isLarge: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProductCardAddToCartButton(product: product,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

