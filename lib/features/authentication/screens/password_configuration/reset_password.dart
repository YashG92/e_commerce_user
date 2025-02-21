import 'package:e_commerce_user/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_user/features/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;

    final dark = HelperFunctions.isDarkMode(context);
    return 
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            actions: [IconButton(onPressed: ()=> Get.back(), icon: Icon(CupertinoIcons.clear))],
          ),
          body: SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Image
                  Lottie.asset(ImageStrings.verifyEmailGif),
                  ///Title & SubTitle
                  Text(email, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  Text('Password Reset Email Sent',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
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
                        onPressed: ()=>Get.offAll(()=> LoginScreen()), child: Text('Done')),),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  Obx(()=> SizedBox(width: double.infinity,child: TextButton(onPressed: ()=> controller.isResendButtonOn.value ? controller.resendPasswordResetEmail() : null, child:controller.isResendButtonOn.value? Text('Resend Email') : Text('Wait for ${controller.countdown.value} s')),))

                ],
              ),
            )
          ),
        );
  }
}
