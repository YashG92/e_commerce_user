import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.height = 56,
    this.width = 56,
     this.padding =   TSizes.sm,
    this.fit = BoxFit.cover,
  });

  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double height, width, padding;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width:width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image): AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
