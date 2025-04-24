import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/controllers/coupon_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CouponController());
    final dark = HelperFunctions.isDarkMode(context);
    return Obx(
          () => RoundedContainer(
        showBorder: true,
        backgroundColor: dark ? AColors.dark : AColors.white,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: controller.couponCode,
                onChanged: controller.onCouponTextChanged,
                decoration: InputDecoration(
                  hintText: 'Have a Promo Code? Enter Here',
                  labelStyle: const TextStyle().copyWith(
                    fontSize: 24,
                    color: AColors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            /// Button
            controller.isLoading.value
                ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(color: AColors.grey),
            )
                : ElevatedButton(
              onPressed: controller.isCouponEntered.value
                  ? () => controller.applyCoupon(controller.couponCode.text)
                  : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: controller.isCouponEntered.value
                    ?
                     Colors.white
                    : AColors.dark,

                backgroundColor: controller.isCouponEntered.value
                    ? AColors.primary
                    : AColors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: AColors.grey.withOpacity(0.1),
                ),
              ),
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
