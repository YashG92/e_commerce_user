import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_products.dart';
class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppbar(
        title: Text('Brand',style: Theme.of(context).textTheme.headlineMedium,),
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
              AGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => BrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}