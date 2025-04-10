import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helper/helper_functions.dart';

class CartCounterIcon extends StatelessWidget {
  final Color? iconColor, counterBgColor, counterTextColor;

  const CartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = HelperFunctions.isDarkMode(context);
    return Stack(children: [
      Icon(
        Iconsax.shopping_cart,
        color: iconColor,
      ),
      Positioned(
          right: 0,
          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:
                    counterBgColor ?? (dark ? AColors.white : AColors.black)),
            child: Center(
                child: Obx(
              () => Text(
                controller.noOfCartItems.value.toString(),
                style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: counterTextColor ??
                        (dark ? AColors.black : AColors.white),
                    fontSizeFactor: 0.8),
              ),
            )),
          ))
    ]);
  }
}
