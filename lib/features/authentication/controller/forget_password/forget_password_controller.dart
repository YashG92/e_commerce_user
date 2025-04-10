import 'dart:async';

import 'package:e_commerce_user/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_user/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helper/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{

  static ForgetPasswordController get instance => Get.find();

  //variable
 final email = TextEditingController();
 GlobalKey<FormState> key = GlobalKey<FormState>();

 final isResendButtonOn = true.obs;
 final countdown=0.obs;
 Timer? _timer;

  //send reset password
void sendPasswordResetEmail()async {
  try{
    //Start Loading
    FullScreenLoader.openLoadingDialog(
        'Processing your Request...', ImageStrings.loadingAnimation);


    //Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      FullScreenLoader.stopLoading();
      return;
    }

    //Form Validation
    if(!key.currentState!.validate()){
      FullScreenLoader.stopLoading();
      return;
    }

    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

    //Remove Loader
    FullScreenLoader.stopLoading();

    //Show success message
    Loaders.successSnackBar(title: 'Email Sent!',message: 'Email Link Sent to reset your password');

    Get.to(()=> ResetPassword(email: email.text.trim(),));

  }catch(e){
    FullScreenLoader.stopLoading();
    Loaders.errorSnackBar(title: 'Oh Bad!', message: e.toString());
  }

}
  //resend reset password

  void resendPasswordResetEmail() async {
    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
    Loaders.successSnackBar(title: 'Email Sent!',message: 'Email Link Sent to reset your password');
    setCountdown();



  }

  void setCountdown(){
    isResendButtonOn.value = false;
    countdown.value = 30; // 30 seconds

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
        isResendButtonOn.value = true;
      }
    });
}}