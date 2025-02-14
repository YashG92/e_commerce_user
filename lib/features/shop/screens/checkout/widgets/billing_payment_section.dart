import 'package:e_commerce_user/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(title: 'Payment Methods',buttonTitle: 'Change',onPressed: (){},),
        SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            RoundedContainer(
              height: 50,
              width: 60,
              backgroundColor: dark ? AColors.light:Colors.white,
              padding: EdgeInsets.all(TSizes.sm),
              child:Image(image: AssetImage(ImageStrings.googleLogo),fit: BoxFit.contain,),
            ),
            SizedBox(width: TSizes.spaceBtwItems/6,),
            Text('Gpay',style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
