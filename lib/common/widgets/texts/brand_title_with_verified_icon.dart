import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textColor,
    this.iconColor = AColors.primary,
    this.textAlign = TextAlign.center,  this.isLarge = false,
  });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final bool isLarge;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BrandTitleText(
          title: title,
          textColor: textColor,
          iconColor: iconColor,
          isLarge: isLarge,
          maxLine: maxLine,
          textAlign: textAlign,
        ),
        SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: AColors.primary,
          size: TSizes.iconSm,
        )
      ],
    );
  }
}
