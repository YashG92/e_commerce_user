import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart%20%20';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controllers/product/product_variations_controller.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

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
                children: [
                  ///Title, price stock status
                  Column(
                    children: [
                      Row(
                        children: [
                          const SectionHeading(
                            title: 'Variations',
                            showActionButton: false,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const ProductTitleText(
                                    title: 'Price : ',
                                    smallSize: true,
                                  ),

                                  const SizedBox(
                                    width: TSizes.spaceBtwItems / 4,
                                  ),

                                  ///Actual Price
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
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems / 4,
                                  ),

                                  ///Sale Price
                                  ProductPriceText(
                                    price: controller.getVariationPrice(),
                                  ),
                                ],
                              ),

                              ///Stock

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
                                  )
                                ],
                              ),

                              ProductTitleText(
                                title: controller
                                        .selectedVariation.value.description ??
                                    '',
                                smallSize: true,
                                maxLines: 4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map(
                            (attributeValue) {
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
                            },
                          ).toList(),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
