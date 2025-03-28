import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text('Saved',
      style: Theme.of(context).textTheme.headlineMedium,
      ),),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              AGridLayout(itemCount: 6, itemBuilder: (_,index) => ProductCardVertical(product: ProductModel.empty(),))
            ],
          ),
        ),
      ),
    );
  }
}
