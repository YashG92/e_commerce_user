import 'package:e_commerce_user/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/search_container.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product/product_controller.dart';
import '../all_products/all_products.dart';
import '../global_search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Appbar
                  const HomeAppBar(),

                  /// Searchbar
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SearchContainer(
                    text: "Search for Store",
                    onTap: () => Get.to(() => const SearchScreen(),
                  ),
                  ),
                  /// Categories
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
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
                  const PromoSlider(),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///popular product

                  SectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products',
                          futureMethod:
                              productController.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Obx(
                    () {
                      if (productController.isLoading.value) {
                        return const VerticalProductShimmer();
                      }

                      if (productController.featuredProducts.isEmpty) {
                        return Center(
                            child: Text(
                          'No products found.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ));
                      }
                      return AGridLayout(
                        itemCount: productController.featuredProducts.length,
                        itemBuilder: (_, index) => ProductCardVertical(
                          product: productController.featuredProducts[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
