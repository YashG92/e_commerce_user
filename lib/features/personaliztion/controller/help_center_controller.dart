import 'package:e_commerce_user/data/repositories/user/user_repository.dart';
import 'package:e_commerce_user/features/personaliztion/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';
import '../model/help_center_model.dart';

class HelpCenterController extends GetxController {
  static HelpCenterController get instance => Get.find();

  final helpCenterFormKey = GlobalKey<FormState>();
  final userHelpFormLoading = false.obs;
  final userRepository = UserRepository.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailController.text = UserController.instance.user.value.email;
  }

  ///Save user help center form
  Future<void> saveHelpCenterForm() async {
    try {
      userHelpFormLoading.value = true;
      FullScreenLoader.openLoadingDialog(
          'Submitting Issue', ImageStrings.loadingAnimation);
      if (helpCenterFormKey.currentState!.validate()) {
        final helpCenterModel = HelpCenterModel(
          email: emailController.text,
          subject: subjectController.text,
          message: messageController.text,
        );
        await userRepository.saveHelpCenterForm(helpCenterModel);
        // Clear the form fields after submission
        subjectController.clear();
        messageController.clear();
      }
      FullScreenLoader.stopLoading();
      Loaders.successSnackBar(
          title: 'Success',
          message: 'Your issue has been submitted successfully');
    } catch (e) {
      HelpCenterModel.empty();
      Loaders.errorSnackBar(title: 'Oh Bad!', message: e.toString());
    } finally {
      userHelpFormLoading.value = false;
    }
  }
}
