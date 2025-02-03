import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {

  final VoidCallback onPress;
  final Color? iconColor;

  const CartCounterIcon({
    super.key, required this.onPress, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Icon(Iconsax.shopping_cart,color: iconColor,),
      Positioned(
          right: 0,

          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AColors.black.withOpacity(0.5)),
            child: Center(

                child: Text(
                  '2',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AColors.white,fontSizeFactor: 0.8),
                )),
          ))
    ]);
  }
}
