import 'package:e_commerce_user/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart%20%20';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/screens/product_detail/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final salePercentage = productController.calculateSalePercentage(
        product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
        product: product,
      )),
      child: Card(
        elevation: 2,
        child: Container(
          width: 270,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.productImageRadius),
              color: dark ? AColors.darkerGrey : AColors.lightContainer),
          child: Row(
            children: [
              /// Thumbnail
              RoundedContainer(
                height: 120,
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? AColors.dark : AColors.light,
                child: Stack(
                  children: [
                    /// Thumbnail Image
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: RoundedImage(
                        isNetworkImage: true,
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                      ),
                    ),

                    ///Sale
                    if (salePercentage != null)
                      Positioned(
                        top: 8,
                        child: RoundedContainer(
                          radius: TSizes.sm,
                          backgroundColor: AColors.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: Text(
                            '$salePercentage%',
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
                        child: FavoriteIcon(
                          productId: product.id,
                        )),
                  ],
                ),
              ),

              ///Details
              SizedBox(
                width: 132,
                child: Padding(
                  padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitleText(
                            title: product.title,
                            smallSize: true,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 2,
                          ),
                          BrandTitleWithVerifiedIcon(title: product.brand!.name),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Price
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                          Container(
                            decoration: BoxDecoration(
                                color: dark ? Colors.blue : AColors.black,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(TSizes.cardRadiusMd),
                                    bottomRight: Radius.circular(TSizes.cardRadiusMd))),
                            child: SizedBox(
                                height: TSizes.iconLg,
                                width: TSizes.iconLg,
                                child: Icon(
                                  Iconsax.add,
                                  color: AColors.white,
                                )),
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
      ),
    );
  }
}
