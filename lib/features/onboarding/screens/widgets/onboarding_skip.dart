import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Get.height*.05,
        left: Get.width *.8,
        child: TextButton(onPressed: (){}, child: Text('Skip',style: TextStyle(color: Colors.black),)));
  }
}