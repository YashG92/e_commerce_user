import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
        top: Get.height*.05,
        left: Get.width *.8,
        child: TextButton(onPressed: ()=>OnBoardingController.instance.skipPage(), child: Text('Skip',style: TextStyle(color: dark ? Colors.white:Colors.black),)));
  }
}