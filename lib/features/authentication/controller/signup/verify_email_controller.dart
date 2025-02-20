import 'dart:async';

import 'package:e_commerce_user/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_user/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: 'Email Sent', message: 'Please check inbox and verify email');
    } catch (e) {
      Loaders.errorSnackBar(title: 'oh bad!', message: e.toString());
    }
  }

  setTimerForRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: ImageStrings.successGif,
              title: 'Successfully Registered',
              subTitle: 'Email verification is Done',
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  ///manual check if email is verified
  manualCheckEmailVerificationStatus() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Get.off(() => SuccessScreen(
            image: ImageStrings.successGif,
            title: 'Successfully Registered',
            subTitle: 'Email verification is Done',
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
