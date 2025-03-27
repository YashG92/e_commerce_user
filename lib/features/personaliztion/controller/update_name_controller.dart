import 'package:e_commerce_user/data/repositories/user/user_repository.dart';
import 'package:e_commerce_user/features/personaliztion/controller/user_controller.dart';
import 'package:e_commerce_user/features/personaliztion/screens/settings/widgets/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart%20%20';

import '../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helper/network_manager.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile/profile.dart';

class UpdateNameController extends GetxController{

  static UpdateNameController get instance => Get.find();

  final fullName=TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  //fetch user record
Future<void> initializeName() async{
    fullName.text=userController.user.value.fullName;
}

  Future<void>updateFullName() async {
    try {
      //Start Loading
      FullScreenLoader.openLoadingDialog(
          'We are updating your info...', ImageStrings.loadingAnimation);


      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Validate Form
      if (!updateUserNameFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String,dynamic> name = {"FullName" : fullName.text.trim()};

      await userRepository.updateSingleFieldUserData(name);


      userController.user.value.fullName = fullName.text.trim();




      FullScreenLoader.stopLoading();

      //Show success message
      Loaders.successSnackBar(title: 'Congratulations!',message: 'Your name has been updated.');

      //Move to Screen
    Get.off(()=>ProfileScreen());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Bad!', message: e.toString());
    }
  }

}