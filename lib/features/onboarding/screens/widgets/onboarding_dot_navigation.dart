import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: kBottomNavigationBarHeight + 25,
        left : 24,
        child: SmoothPageIndicator(controller: PageController(), count: 3, effect: ExpandingDotsEffect(activeDotColor: dark ? AColors.light:AColors.dark, dotHeight: 6),));
  }
}
