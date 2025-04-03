import 'package:e_commerce_user/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_user/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const ShimmerEffect(width: 300, height: 80));
  }
}
