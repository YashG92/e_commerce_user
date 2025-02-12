import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_user/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:e_commerce_user/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../utils/helper/helper_functions.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification))
        ],
        title: Text(
          'Details',
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Product Image
              ProductImageSlider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              ///Product Detail
              Column(
                children: [

                  ///Rating & Share

                  RatingAndShare(),

                  ///Price Title Stock & Description

                  ProductMetaData(),

                  ///Attributes

                  SizedBox(height: TSizes.spaceBtwItems,),
                  ProductAttributes(),

                  ///Checkout Button
                  ///Reviews
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}


