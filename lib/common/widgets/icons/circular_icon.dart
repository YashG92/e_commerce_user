import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: dark ?  AColors.black.withValues(alpha: 0.9) : AColors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: (){}, icon: Icon(Iconsax.heart5,color: Colors.red,)),
    );
  }
}
