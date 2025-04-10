import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_user/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:e_commerce_user/features/shop/controllers/product/images_controller.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
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
    return Column(
      children: [
        Stack(
          children: [
            RoundedContainer(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              backgroundColor: dark ? AColors.darkerGrey : AColors.white,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = imagesController.selectedProductImage.value;
                      return GestureDetector(
                        onTap: ()=> imagesController.showEnlargedImage(image),
                        child: Hero(
                          tag: product.id,
                          child: CachedNetworkImage(
                            imageUrl: image,
                            progressIndicatorBuilder: (_, __, downloadProgress) =>
                                CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AColors.primary,
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
              child: FavoriteIcon(productId: product.id,),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        ///ImageSlider

        SizedBox(
          height: 80,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            itemCount: images.length,
            itemBuilder: (_, index) => Obx(
              () {
                final imageSelected = imagesController.selectedProductImage.value == images[index];
                return RoundedImage(
                  borderRadius: 6,
                  width: 80,
                  backgroundColor: dark ? AColors.dark : AColors.white,
                  padding: const EdgeInsets.all(TSizes.sm),
                  imageUrl: images[index],
                  isNetworkImage: true,
                  onPressed: ()=> imagesController.selectedProductImage.value = images[index],
                  border: Border.all(color: imageSelected ? AColors.primary: Colors.transparent),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
