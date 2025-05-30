import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_user/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:e_commerce_user/features/shop/controllers/product/images_controller.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final imagesController = Get.put(ImagesController());
    final images = imagesController.getAllProductImages(product);

    // Initialize PageController for swipe functionality
    final PageController pageController = PageController();

    return Column(
      children: [
        Stack(
          children: [
            RoundedContainer(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              backgroundColor: dark ? AColors.darkerGrey : AColors.white,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius / 2),
                child: Center(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      imagesController.selectedProductImage.value =
                          images[index];
                    },
                    itemBuilder: (_, index) {
                      final image = images[index];
                      return GestureDetector(
                        onTap: () => imagesController.showEnlargedImage(image),
                        child: Hero(
                          tag: product.id,
                          child: CachedNetworkImage(
                            imageUrl: image,
                            progressIndicatorBuilder: (_, __, downloadProgress) => Center(
                              child: SizedBox(
                                width: 20, // Adjust size as needed
                                height: 20, // Adjust size as needed
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: AColors.primary,
                                  strokeWidth: 2, // Make the line thinner
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: FavoriteIcon(productId: product.id),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Thumbnail Images
        SizedBox(
          height: 80,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) =>
                const SizedBox(width: TSizes.spaceBtwItems),
            itemCount: images.length,
            itemBuilder: (_, index) => Obx(
              () {
                final imageSelected =
                    imagesController.selectedProductImage.value ==
                        images[index];
                return GestureDetector(
                  onTap: () {
                    imagesController.selectedProductImage.value = images[index];
                    // Animate to the selected page
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: RoundedImage(
                    borderRadius: 6,
                    width: 80,
                    backgroundColor: dark ? AColors.dark : AColors.white,
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: images[index],
                    isNetworkImage: true,
                    border: Border.all(
                      color:
                          imageSelected ? AColors.primary : Colors.transparent,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
