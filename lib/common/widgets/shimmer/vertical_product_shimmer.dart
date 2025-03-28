import 'package:e_commerce_user/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_user/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerEffect(width: 180, height: 180),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ShimmerEffect(width: 160, height: 15),
                  SizedBox(
                    height: TSizes.spaceBtwItems/2,
                  ),
                  ShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
