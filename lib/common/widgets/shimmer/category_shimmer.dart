import 'package:e_commerce_user/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems/2,),
              ShimmerEffect(width: 55, height: 8,),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
      ),
    );
  }
}
