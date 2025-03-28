import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_user/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_attributes.dart';
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
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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

                  if (product.productType == ProductType.variable.toString())
                    ProductAttributes(product: product,),

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace / 2.5),
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor:
                                dark ? AColors.light : AColors.dark,
                            backgroundColor:
                                dark ? AColors.darkerGrey : AColors.grey),
                        onPressed: () {},
                        child: Text('Add to cart')))),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(
                child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor:
                                dark ? AColors.dark : AColors.light,
                            backgroundColor:
                                dark ? AColors.light : AColors.dark),
                        onPressed: () {},
                        child: Text('Buy now')))),
          ],
        ),
      ),
    );
  }
}
