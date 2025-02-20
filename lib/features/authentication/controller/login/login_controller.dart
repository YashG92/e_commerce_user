import 'package:flutter/cupertino.dart';
import 'package:get/get.dart%20%20';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helper/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  ///variable
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final rememberMe = false.obs;

  final localStorage = GetStorage();

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }



  Future<void>signInWithEmailPassword() async {
    try {
      //Start Loading
      FullScreenLoader.openLoadingDialog(
          'Logging into your account', ImageStrings.loadingAnimation);


      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Validate Form
      if (!formKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      ///Save data if remember me
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      /// login user
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(),password.text.trim());



      FullScreenLoader.stopLoading();

      //Show success message
      Loaders.successSnackBar(title: 'Congratulations!',message: 'You have been Logged in successfully.');

      //Move to Screen
       AuthenticationRepository.instance.screenRedirect();


    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Bad!', message: e.toString());
    }
  }
}