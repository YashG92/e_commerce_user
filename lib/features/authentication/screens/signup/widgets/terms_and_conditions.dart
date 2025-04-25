import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/helper/helper_functions.dart';
import '../../../controller/signup/signup_controller.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Row(
      children: [
        Obx(() => SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                  value: controller.checkTerms.value,
                  onChanged: (value) => controller.checkTerms.value = value!),
            )),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By signing up you agree to our ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: 'Terms',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? Colors.white : Colors.black,
                      ),
                ),
                TextSpan(
                  text: ', ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? Colors.white : Colors.black,
                      ),
                ),
                TextSpan(
                  text: ', and ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: 'Cookie Use',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? Colors.white : Colors.black,
                      ),
                ),
                TextSpan(
                  text: '.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
