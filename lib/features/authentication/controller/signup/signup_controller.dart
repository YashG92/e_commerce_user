import 'package:e_commerce_user/common/widgets/loaders/full_screen_loader.dart';
import 'package:e_commerce_user/features/personaliztion/model/user_model.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart%20%20';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/helper/network_manager.dart';
import '../../screens/signup/verify_email.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final checkTerms = false.obs;
  final email = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///SignUP
  signup() async {
    try {
      //Start Loading
      FullScreenLoader.openLoadingDialog(
          'Creating Account', ImageStrings.loadingAnimation);


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

      //Privacy Policy Check
      if (!checkTerms.value) {
        Loaders.warningSnackBar(title: 'Accept Privacy Policy',
            message: 'Please accept the privacy policy to continue');
        return;
      }

      //Register User in firebase & save data in firestore
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      //Save auth user data in firebase firestore
      final newUser = UserModel(id: userCredential.user!.uid,
          fullName: fullName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserData(newUser);


      FullScreenLoader.stopLoading();

      //Show success message
      Loaders.successSnackBar(title: 'Congratulations!',message: 'Your account has been created successfully.');

      //Move to verify email screen
      Get.to(()=> const VerifyEmailScreen());


    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Bad!', message: e.toString());
    }
  }


}