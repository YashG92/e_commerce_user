import 'package:e_commerce_user/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/models/category_model.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key, required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Brands
            BrandShowCase(
              images: [
                ImageStrings.productImage1,
                ImageStrings.productImage2,
                ImageStrings.productImage3
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems,),
            BrandShowCase(
              images: [
                ImageStrings.productImage1,
                ImageStrings.productImage2,
                ImageStrings.productImage3
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems,),

            ///Products
            SectionHeading(title: 'You might like', onPressed: (){},),
            SizedBox(height: TSizes.spaceBtwItems,),
            AGridLayout(itemCount: 4, itemBuilder: (_,index)=> ProductCardVertical(product: ProductModel.empty(),)),
            SizedBox(height: TSizes.spaceBtwSections,)
          ],
        ),
      ),
    );
  }
}
