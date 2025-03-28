import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../products/product_card/product_card_vertical.dart';

class AGridLayout extends StatelessWidget {
  const AGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 278,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: TSizes.spaceBtwItems,
        crossAxisSpacing: TSizes.spaceBtwItems,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
