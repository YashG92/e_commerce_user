import 'package:e_commerce_user/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
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

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
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
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      SearchContainer(
                        text: 'Search',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      ///Feature Brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: ()=> Get.to(()=> AllBrandsScreen()),
                      ),

                      SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      AGridLayout(
                          mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return BrandCard(
                              showBorder: true,
                              onTap:()=> Get.to(()=> BrandProducts()),
                            );
                          }),
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Clothing'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Home'),
                    ),
                    Tab(
                      child: Text('Sports'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),

          ]),
        ),
      ),
    );
  }
}

