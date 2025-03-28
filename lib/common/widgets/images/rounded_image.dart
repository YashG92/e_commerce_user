import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../shimmer/shimmer.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = AColors.light,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
    this.padding,
  });

  final double? height, width;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => ShimmerEffect(
                            width: width ?? double.infinity,
                            height: height ?? 158),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(
                      imageUrl,
                    ))),
      ),
    );
  }
}
