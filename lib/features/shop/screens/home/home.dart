import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_user/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/search_container.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Appbar
                  HomeAppBar(),

                  /// Searchbar
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SearchContainer(
                    text: "Search for Store",
                  ),

                  /// Categories
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///Heading
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: AColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ///Categories
                        HomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  PromoSlider(
                    banners: [
                      ImageStrings.banner_4,
                      ImageStrings.banner_5,
                      ImageStrings.banner_6
                    ],
                  ),

                  SizedBox(height: TSizes.spaceBtwSections,),
                  ///popular product


                  SectionHeading(title: 'Popular Products',onPressed: ()=>Get.to(()=>AllProducts()),),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  AGridLayout(itemCount: 6,itemBuilder: (_,index)=> ProductCardVertical(),),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

