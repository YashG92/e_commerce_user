import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:e_commerce_user/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text('Sports',style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              RoundedImage(
                imageUrl: ImageStrings.banner_1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Sub Categories
              Column(
                children: [
                  ///Heading
                  SectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context,index) => SizedBox(width: TSizes.spaceBtwItems,),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ProductCardHorizontal(product: ProductModel.empty(),),

                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}