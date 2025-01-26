import 'package:e_commerce_user/features/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helper/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
        right: 24,
        bottom: kBottomNavigationBarHeight,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: dark ? Colors.white : Colors.black),
            onPressed: () =>OnBoardingController.instance.nextPage(),
            child: Icon(
              Iconsax.arrow_right_3,
              size: 30,
              color: dark ? Colors.black : Colors.white,
            )));
  }
}
