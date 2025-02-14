import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_user/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/checkout_screen.dart';

import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/helper/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: CartItems(showAddRemoveButton: true,),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left:TSizes.defaultSpace,right: TSizes.defaultSpace,top: TSizes.defaultSpace,),
        child: SizedBox(height: 50,
          child: ElevatedButton(

              onPressed: ()=>Get.to(()=>CheckoutScreen()), child: Text('Checkout ₹25,000')),
        ),
      ),
    );
  }
}


