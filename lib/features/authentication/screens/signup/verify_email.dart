import 'package:e_commerce_user/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/colors.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: ()=> Get.offAll(()=>LoginScreen()), icon: Icon(Icons.clear))],),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Image
                Lottie.asset(ImageStrings.verifyEmailGif),
                ///Title & SubTitle
                Text('Verify your email address!', style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwItems,),
                Text('email@gmail.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwSections,),
                ///Buttons

                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                          dark ? Colors.white : Colors.black,
                          foregroundColor:
                          dark ? AColors.dark : Colors.white,
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: ()=> Get.to(()=> SuccessScreen(title: 'Your account is successfully created!',subTitle: 'congrats',onPressed: ()=> Get.off(()=> LoginScreen()), image: ImageStrings.successGif,)), child: Text('Continue')),),
                SizedBox(height: TSizes.spaceBtwItems,),
                SizedBox(width: double.infinity,child: TextButton(onPressed: (){}, child: Text('Resend Email')),)
              ],
            ),
          ),
        ),

      );
  }
}
