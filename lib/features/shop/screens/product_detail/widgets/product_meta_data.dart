import 'package:e_commerce_user/common/widgets/images/circular_image.dart';
import 'package:e_commerce_user/common/widgets/texts/brand_title_text.dart';
import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;
    final salePercentage = productController.calculateSalePercentage(
        product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Title

        //Text('Nike',style: Theme.of(context).textTheme.headlineSmall,),
        Row(
          children: [
            CircularImage(
              width: 48,
              height: 48,
              overlayColor: dark ? AColors.white : AColors.black,
              image: product.brand != null ? product.brand!.image : '',
              isNetworkImage: true,
            ),
            BrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              isLarge: true,
            ),
          ],
        ),
        ProductTitleText(title: product.title),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        ///Price & Sale Price

        Row(
          children: [
            //sale
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: Colors.green.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: AColors.black),
              ),
            ),

            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              ProductPriceText(
                price: product.price.toString(),
                lineThrough: true,
                isLarge: true,
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),

            ProductPriceText(
              price: productController.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Description
        const SectionHeading(
          title: 'Description',
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          product.description ?? '',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Show less',
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        ///Stock Status
        Row(
          children: [
            ProductTitleText(
              title: 'Status : ',
            ),
            Text(
              productController.getProductStockStatus(product),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),

        ///Brand
      ],
    );
  }
}
