import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Stack(
          children: [
            RoundedContainer(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              backgroundColor: dark ? AColors.darkerGrey : AColors.light,
              child: Padding(
                padding:
                const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                        image: AssetImage(ImageStrings.productImage1))),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircularIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
                size: 26,
              ),
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        ///ImageSlider

        SizedBox(
          height: 80,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) =>
                  RoundedImage(
                      borderRadius: 6,
                      width: 80,
                      backgroundColor:
                      dark ? AColors.dark : AColors.white,
                      border: Border.all(color: AColors.primary),
                      padding: EdgeInsets.all(TSizes.sm),
                      imageUrl: ImageStrings.productImage1),
              separatorBuilder: (_, __) => SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              itemCount: 6),
        ),
      ],
    );
  }
}
