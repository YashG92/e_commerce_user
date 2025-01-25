import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

          Positioned(
              top: Get.height*.05,
              left: Get.width *.8,
              child: TextButton(onPressed: (){}, child: Text('Skip',style: TextStyle(color: Colors.black),))),


          //Next button
          //navigation indicator
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
            height: Get.height * 0.6,
            width: Get.width * 0.8,
            image: AssetImage(image)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
