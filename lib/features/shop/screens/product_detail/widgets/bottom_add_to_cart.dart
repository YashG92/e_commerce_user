import 'package:e_commerce_user/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/helper/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? AColors.darkerGrey : AColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Row(
              children: [
                CircularIcon(
                  icon: Iconsax.minus,
                  width: 32,
                  height: 32,
                  size: TSizes.md,
                  color: dark ? AColors.white : AColors.black,
                  backgroundColor: dark ? AColors.darkerGrey : AColors.grey,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                CircularIcon(
                  icon: Iconsax.add,
                  width: 32,
                  height: 32,
                  size: TSizes.md,
                  color: AColors.white,
                  backgroundColor: AColors.primary,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
          ),
          Obx(
            () => ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addProductToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
              ),
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}
