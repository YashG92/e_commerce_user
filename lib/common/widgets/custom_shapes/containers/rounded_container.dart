import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.height,
      this.width,
       this.radius = TSizes.cardRadiusLg,
      this.child,
       this.showBorder = false,
       this.borderColor = AColors.primary,
       this.backgroundColor = AColors.white,
      this.padding,
      this.margin});

  final double? height, width;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor): null,
      ),
      child: child,
    );
  }
}
