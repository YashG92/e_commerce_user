import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key, required this.images,
  });

  final List<String> images ;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: EdgeInsets.all(TSizes.md),

      showBorder: true,
      borderColor: AColors.darkGrey,
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          ///Brand Card

          BrandCard(showBorder: false),

          ///Top product

          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context){
  return Expanded(
    child: RoundedContainer(
      height: 100,
      backgroundColor:
      HelperFunctions.isDarkMode(context) ? AColors.darkGrey : AColors.light,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(right: TSizes.sm),

      child: Image(
          fit: BoxFit.contain,
          image:
          AssetImage(image)),
    ),
  );
}
