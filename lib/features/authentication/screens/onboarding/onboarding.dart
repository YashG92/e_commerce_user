import 'package:e_commerce_user/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce_user/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:e_commerce_user/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce_user/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndex,
            children: [
              //Scroll page
              const OnBoardingPage(
                title: TextStrings.onBoardingTitle1,
                subTitle:
                    TextStrings.onBoardingSubTitle1,
                image: ImageStrings.onBoardingImage1,
              ),
              const OnBoardingPage(
                title: TextStrings.onBoardingTitle2,
                subTitle:
                TextStrings.onBoardingSubTitle2,
                image: ImageStrings.onBoardingImage2,
              ),
              const OnBoardingPage(
                title: TextStrings.onBoardingTitle3,
                subTitle:
                TextStrings.onBoardingSubTitle3,
                image: ImageStrings.onBoardingImage3,
              ),


            ],

          ),
          //Skip button

          const OnBoardingSkip(),


          //Next button
          const OnBoardingNextButton(),
          //navigation indicator
          const OnBoardingDotNavigation()
        ],
      ),
    );
  }
}





