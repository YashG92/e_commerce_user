import 'package:e_commerce_user/common/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_user/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:e_commerce_user/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:e_commerce_user/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_user/features/shop/models/category_model.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ListTileShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              BoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          );

          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (_,__)=>const SizedBox(height: TSizes.spaceBtwItems,),
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_,index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id,limit: 3),
              builder: (context, snapshot) {
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                final products = snapshot.data!;
                return BrandShowCase(images: products.map((e)=>e.thumbnail).toList(), brand: brand,);
              }
            );
          });
        });
  }
}
