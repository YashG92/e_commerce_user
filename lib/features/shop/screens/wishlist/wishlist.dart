import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_user/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_user/features/personaliztion/controller/favorites_controller.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/navigation_menu.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Saved',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                ()=> FutureBuilder(
                    future: controller.favoriteProducts(),
                    builder: (context, snapshot) {
                      final emptyWidget = AnimationLoaderWidget(
                        text: 'Oops!, Wishlist is Empty',
                        animation: ImageStrings.successGif,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );

                      const loader = VerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget = TCloudHelperFunctions.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;

                      return AGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => ProductCardVertical(
                          product: products[index],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
