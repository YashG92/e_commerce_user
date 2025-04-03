import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
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
    return Text(
      textAlign: textAlign,
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: isLarge ? Theme.of(context).textTheme.titleSmall : Theme.of(context).textTheme.labelMedium,
    );
  }
}
