import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_user/features/shop/controllers/home_controller.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index,_)=> controller.updatePageIndicator(index),
              autoPlay: true,
            )),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
              ()=> Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  ACircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.currentIndex.value == i ? AColors.primary : AColors.grey,
                    margin: EdgeInsets.only(right: 10),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
