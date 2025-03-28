import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helper/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
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
                              ProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),

                              SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),

                              ///Actual Price
                              ProductPriceText(
                                price: '1,435',
                                lineThrough: true,
                              ),
                              SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),

                              ///Sale Price
                              ProductPriceText(
                                price: '1,235',
                              ),
                            ],
                          ),

                          ///Stock

                          Row(
                            children: [
                              ProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                'In Stock',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
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
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),




        ///Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Wrap(
              spacing: 8,
              children: [
                AChoiceChip(text: 'Green',selected: true,onSelected: (value){},),
                AChoiceChip(text: 'Red',selected: false,onSelected: (value){},),
                AChoiceChip(text: 'Yellow',selected: false,onSelected: (value){},),
              ],
            )
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Wrap(
              spacing: 8,
              children: [
                AChoiceChip(text: 'UK 09',selected: true,onSelected: (value){},),
                AChoiceChip(text: 'UK 10',selected: false,onSelected: (value){},),
                AChoiceChip(text: 'UK 11',selected: false,onSelected: (value){},),
              ],
            )
          ],
        ),
      ],
    );
  }
}

