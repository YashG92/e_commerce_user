import 'package:e_commerce_user/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_user/common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_user/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_user/features/shop/screens/brand/all_brands.dart';
import 'package:e_commerce_user/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/search_container.dart';
import 'package:e_commerce_user/features/shop/screens/shop/widgets/category_tab.dart';
import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../global_search_screen.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = HelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppbar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Colors.white,
                expandedHeight: 420,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Hero(
                        tag: 'search-bar',
                        child: Material(
                          color: Colors.transparent,
                          child: SearchContainer(
                            text: 'Search',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                            onTap: () => Get.to(() => const GlobalSearchScreen()),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      ///Feature Brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      Obx(
                        () {
                          if (brandController.isLoading.value) {
                            return const BrandsShimmer();
                          }
                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text('No Brands Found',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(color: Colors.white)),
                            );
                          }

                          return AGridLayout(
                              mainAxisExtent: 80,
                              itemCount: brandController.featuredBrands.length,
                              itemBuilder: (_, index) {
                                final brand = brandController.featuredBrands[index];
                                return BrandCard(
                                  brand: brand,
                                  showBorder: true,
                                  onTap: () => Get.to(() => BrandProducts(brand: brand,)),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: categories
                      .map((category) => Tab(
                            child: Text(category.name),
                          ))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => CategoryTab(category: category))
                  .toList()),
        ),
      ),
    );
  }
}
