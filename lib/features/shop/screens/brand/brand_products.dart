import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_user/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_user/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          brand.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    const loader = VerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) {
                      return widget;
                    }

                    final brandProducts = snapshot.data!;

                    return SortableProducts(
                      products: brandProducts,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
