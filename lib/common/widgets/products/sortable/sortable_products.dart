import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart%20%20';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/all_products_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_card/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
            dropdownColor: Colors.white,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              prefixIcon: const Icon(Iconsax.sort),
            ),
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
            value: controller.selectedSortOption.value,
            onChanged: (value) {
              controller.sortProducts(value!);
            }),

        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Products
        Obx(
          () => AGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>
                  ProductCardVertical(product: controller.products[index])),
        )
      ],
    );
  }
}
