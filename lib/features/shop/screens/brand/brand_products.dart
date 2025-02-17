import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text('Nike',style: Theme.of(context).textTheme.headlineMedium,),
      ),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),
              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}