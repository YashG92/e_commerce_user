import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(title: 'Payment Methods',buttonTitle: 'Change',onPressed: ()=>controller.selectPaymentMethod(context),),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Obx(
          ()=> Row(
            children: [
              RoundedContainer(
                height: 50,
                width: 60,
                backgroundColor: dark ? AColors.light:Colors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child:Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              SizedBox(width: TSizes.spaceBtwItems/6,),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,),
            ],
          ),
        )
      ],
    );
  }
}
