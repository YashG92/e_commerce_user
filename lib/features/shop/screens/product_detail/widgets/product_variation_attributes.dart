import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controllers/product/product_variations_controller.dart';

class ProductVariationAttributes extends StatelessWidget {
  const ProductVariationAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductVariationsController());
    final dark = HelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            RoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? AColors.darkerGrey : AColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Added
                children: [
                  /// Title, price and stock status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // Added
                    children: [
                      const SectionHeading(
                        title: 'Variations',
                        showActionButton: false,
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Expanded(
                        // This ensures the column takes remaining space
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Price Row
                            Row(
                              children: [
                                const ProductTitleText(
                                  title: 'Price : ',
                                  smallSize: true,
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems / 4),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (controller
                                            .selectedVariation.value.salePrice >
                                        0)
                                      Text(
                                        '${controller.selectedVariation.value.price}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .apply(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                      ),
                                    ProductPriceText(
                                      price: controller.getVariationPrice(),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            /// Stock Row
                            Row(
                              children: [
                                const ProductTitleText(
                                  title: 'Stock : ',
                                  smallSize: true,
                                ),
                                Text(
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),

                            /// Description - Fixed with proper constraints
                            Padding(
                              padding: const EdgeInsets.only(top: TSizes.sm),
                              child: SizedBox(
                                width: double.infinity, // Takes full width
                                child: ReadMoreText(
                                  controller.selectedVariation.value
                                          .description ??
                                      '',
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  trimExpandedText: ' show less',
                                  trimCollapsedText: ' show more',
                                  moreStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AColors.primary),
                                  lessStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AColors.primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);

                              return AChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
