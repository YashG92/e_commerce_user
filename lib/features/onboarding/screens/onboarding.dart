import 'package:e_commerce_user/features/onboarding/screens/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce_user/features/onboarding/screens/widgets/onboarding_page.dart';
import 'package:e_commerce_user/features/onboarding/screens/widgets/onboarding_skip.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              //Scroll page
              OnBoardingPage(
                title: TextStrings.onBoardingTitle1,
                subTitle:
                    TextStrings.onBoardingSubTitle1,
                image: ImageStrings.onBoardingImage1,
              ),
              OnBoardingPage(
                title: TextStrings.onBoardingTitle2,
                subTitle:
                TextStrings.onBoardingSubTitle2,
                image: ImageStrings.onBoardingImage2,
              ),
              OnBoardingPage(
                title: TextStrings.onBoardingTitle3,
                subTitle:
                TextStrings.onBoardingSubTitle3,
                image: ImageStrings.onBoardingImage3,
              ),


            ],

          ),
          //Skip button

          OnBoardingSkip(),


          //Next button
          //navigation indicator
          OnBoardingDotNavigation()
        ],
      ),
    );
  }
}




