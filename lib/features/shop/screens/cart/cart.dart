import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/texts/product_price_text.dart';

import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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
          child: ListView.separated(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Column(
                    children: [
                      CartItem(),
                      SizedBox(height: TSizes.spaceBtwItems,),
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
              itemCount: 10),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left:TSizes.defaultSpace,right: TSizes.defaultSpace,top: TSizes.defaultSpace,),
        child: SizedBox(height: 50,
          child: ElevatedButton(

              onPressed: (){}, child: Text('Checkout ₹25,000')),
        ),
      ),
    );
  }
}


