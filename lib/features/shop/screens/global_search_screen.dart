import 'package:e_commerce_user/features/shop/controllers/global_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../utils/constants/sizes.dart';

class GlobalSearchScreen extends StatelessWidget {
  const GlobalSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeSearchController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Hero(
          tag: 'search-bar',
          child: Material(
            color: Colors.transparent,
            child: TextField(
              autofocus: true,
              onChanged: controller.onSearch,
              decoration: const InputDecoration(
                hintText: 'Search products, brands, attributes...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: VerticalProductShimmer(itemCount: 6),
          );
        }

        if (controller.searchedProducts.isEmpty &&
            controller.query.isNotEmpty) {
          return const Center(child: Text("No matching results found."));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: AGridLayout(
                itemCount: controller.searchedProducts.length,
                itemBuilder: (_, index) => ProductCardVertical(
                    product: controller.searchedProducts[index])),
          ),
        );
      }),
    );
  }
}
