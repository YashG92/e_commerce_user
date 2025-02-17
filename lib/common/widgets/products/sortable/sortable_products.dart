import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_card/product_card_vertical.dart';


class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(

              border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(10)),
              prefixIcon: Icon(Iconsax.sort),),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ]
                .map((option) => DropdownMenuItem(
              child: Text(option),
              value: option,
            ))
                .toList(),
            onChanged: (value) {}),

        SizedBox(height: TSizes.spaceBtwSections,),
        /// Products
        AGridLayout(itemCount: 8, itemBuilder: (_,index) => ProductCardVertical())
      ],
    );
  }
}