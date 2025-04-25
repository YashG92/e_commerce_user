import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final attributes = product.productAttributes ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes.map((attribute) {
        return Padding(
          padding: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  attribute.name ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: attribute.values!
                      .map(
                        (value) => Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
