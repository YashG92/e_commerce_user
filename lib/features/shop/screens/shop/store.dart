import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_user/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce_user/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/search_container.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/circular_image.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        automaticallyImplyLeading: false,
        //actions: [CartCounterIcon(onPress: () {})],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? Colors.black : Colors.white,
                expandedHeight: 400,
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
                        onPressed: () {},
                      ),

                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      AGridLayout(
                        mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              child: RoundedContainer(
                                padding: EdgeInsets.all(
                                  TSizes.sm,
                                ),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: CircularImage(
                                        image: ImageStrings.nikeLogo,
                                        isNetworkImage: false,
                                        backgroundColor: Colors.transparent,
                                        overlayColor:
                                            dark ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: TSizes.spaceBtwItems / 2,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BrandTitleWithVerifiedIcon(
                                              title: 'Nike'),
                                          Text(
                                            '465 Products ',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
