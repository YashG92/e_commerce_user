import 'package:e_commerce_user/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce_user/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/category_controller.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if (categoryController.isLoading.value) return const CategoryShimmer();
        if (categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              'No data found!',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Colors.white,
                  ),
            ),
          );
        }
        return SizedBox(
          height: 100,
          child: ListView.builder(
              itemCount: categoryController.featuredCategories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return VerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTapItem: () => Get.to(() => SubCategoriesScreen(category: category,)),
                );
              }),
        );
      },
    );
  }
}
