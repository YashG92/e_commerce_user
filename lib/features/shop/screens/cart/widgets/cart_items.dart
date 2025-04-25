import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(
      () => ListView.separated(
        itemCount: controller.cartItems.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => Obx(
          () {
            final item = controller.cartItems[index];
            return Column(
              children: [
                CartItem(
                  cartItem: item,
                ),
                if (showAddRemoveButton)
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                if (showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 70,
                          ),
                          ProductQuantityWithAddRemoveButton(
                            quantity: item.quantity,
                            add: () => controller.addOneToCart(item),
                            remove: () => controller.removeOneFromCart(item),
                          ),
                        ],
                      ),

                      ///Add remove buttons

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductPriceText(
                            price:
                                (item.price * item.quantity).toStringAsFixed(1),
                            lineThrough: true,
                          ),
                          ProductPriceText(
                              price: (item.salePrice * item.quantity)
                                  .toStringAsFixed(1)),
                        ],
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ),
    );
  }
}
