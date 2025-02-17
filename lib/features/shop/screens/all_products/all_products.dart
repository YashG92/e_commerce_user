import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_user/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Iconsax.sort),
                  ),
                  items: [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity'
                  ]
                      .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option)))
                      .toList(),
                  onChanged: (value) {}),
              SizedBox(height: TSizes.spaceBtwSections,),
              AGridLayout(itemCount: 4,itemBuilder: (_,index)=>ProductCardVertical(),)
            ],
          ),
        ),
      ),
    );
  }
}
