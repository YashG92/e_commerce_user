import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../icons/circular_icon.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: dark ? AColors.white : AColors.black,
          backgroundColor: dark ? AColors.darkerGrey : AColors.light,
        ),

        SizedBox(width: TSizes.spaceBtwItems,),
        Text('1',style: Theme.of(context).textTheme.titleSmall,),
        SizedBox(width: TSizes.spaceBtwItems,),
        CircularIcon(icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: AColors.white,
          backgroundColor:AColors.primary,
        ),

      ],
    );
  }
}
