import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/features/shop/controllers/brand_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/shimmer/brands_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Brand',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SectionHeading(title: 'Brands'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Brands
              Obx(
                () {
                  if (brandController.isLoading.value) {
                    return const BrandsShimmer();
                  }
                  if (brandController.allBrands.isEmpty) {
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
                      itemCount: brandController.allBrands.length,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return BrandCard(
                          brand: brand,
                          showBorder: true,
                          onTap: () => Get.to(() => BrandProducts(
                                brand: brand,
                              )),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
