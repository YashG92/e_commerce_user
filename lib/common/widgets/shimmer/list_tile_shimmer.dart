import 'package:e_commerce_user/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ShimmerEffect(width: 50, height: 50,radius: 50,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Column(
              children: [
                ShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems/2,),
                ShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
