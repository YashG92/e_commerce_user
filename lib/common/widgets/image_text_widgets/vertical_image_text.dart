import 'package:e_commerce_user/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTapItem;
  final bool isNetworkImage;

  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AColors.white,
    this.backgroundColor,
    this.onTapItem,
    this.isNetworkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTapItem,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            CircularImage(
              fit: BoxFit.fitWidth,
              padding: TSizes.sm/20,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              //overlayColor: HelperFunctions.isDarkMode(context)? AColors.light : AColors.dark,
              image: image,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}
