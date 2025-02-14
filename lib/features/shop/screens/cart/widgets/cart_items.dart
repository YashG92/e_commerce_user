import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, required this.showAddRemoveButton});
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => Column(
          children: [
            CartItem(),
            if(showAddRemoveButton)SizedBox(height: TSizes.spaceBtwItems,),
            if(showAddRemoveButton)
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    SizedBox(width: 70,),
                    ProductQuantityWithAddRemoveButton(),

                  ],
                ),
                ///Add remove buttons

                ProductPriceText(price: '2,500'),
              ],
            ),
          ],
        ),
        separatorBuilder: (_, __) => SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemCount: 4);
  }
}
