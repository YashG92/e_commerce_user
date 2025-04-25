import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_user/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

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
    this.padding = TSizes.sm,
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
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: 
            isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: image,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const ShimmerEffect(width: 55, height: 55),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: isNetworkImage
                        ? NetworkImage(image)
                        : AssetImage(image) as ImageProvider,
                    color: overlayColor,
                  ),
          
        ),
      ),
    );
  }
}
