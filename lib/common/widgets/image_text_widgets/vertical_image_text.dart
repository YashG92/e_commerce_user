import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';


class VerticalImageText extends StatelessWidget {

  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTapItem;

  const VerticalImageText({
    super.key, required this.image, required this.title, this.textColor=AColors.white, this.backgroundColor, this.onTapItem,
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
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? AColors.black : AColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(image),fit: BoxFit.cover, color: dark ? AColors.light : AColors.dark,),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            SizedBox(
                width: 55,
                child: Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),maxLines:1 ,overflow: TextOverflow.ellipsis,))
          ],
        ),
      ),
    );
  }
}
