import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_user/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_variation_attributes.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/enums.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product, this.selectedVariation});

  final ProductModel product;
  final Map<String,String>? selectedVariation;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification))
        ],
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Product Image
              ProductImageSlider(
                product: product,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Product Detail
              Column(
                children: [
                  ///Rating & Share

                  RatingAndShare(),

                  ///Price Title Stock & Description

                  ProductMetaData(
                    product: product,
                  ),

                  ///Attributes

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  if (product.productType == ProductType.single.toString())
                    ProductAttributes(
                      product: product,
                    ),

                  if (product.productType == ProductType.variable.toString())
                    ProductVariationAttributes(
                      product: product,
                      preSelectedVariation: selectedVariation,
                    ),

                  ///Reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                        title: 'Reviews (12,200)',
                        onPressed: () {},
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () => Get.to(ProductReviewScreen()),
                          icon: Icon(Iconsax.arrow_right_3)),
                    ],
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAddToCart(product: product),
    );
  }
}
