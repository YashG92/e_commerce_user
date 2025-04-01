import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/all_products_controller.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = VerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                if (widget != null) return widget;

                final products = snapshot.data!;
                return SortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
