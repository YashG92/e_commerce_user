import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_user/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_user/features/shop/controllers/banner_controller.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const ShimmerEffect(width: double.infinity, height: 190);
        }
        if (controller.banners.isEmpty) {
          return const Center(
            child: Text('No Banners Found'),
          );
        } else {
          return Column(
            children: [
              CarouselSlider(
                  items: controller.banners
                      .map((banner) => RoundedImage(
                            imageUrl: banner.imageUrl,
                            isNetworkImage: true,
                            onPressed: () => Get.toNamed(banner.targetScreen),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index),
                    autoPlay: true,
                  )),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        ACircularContainer(
                          width: 20,
                          height: 4,
                          backgroundColor: controller.currentIndex.value == i
                              ? AColors.primary
                              : AColors.grey,
                          margin: const EdgeInsets.only(right: 10),
                        )
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
