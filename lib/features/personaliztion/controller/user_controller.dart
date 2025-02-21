import 'package:e_commerce_user/data/repositories/user/user_repository.dart';
import 'package:e_commerce_user/features/personaliztion/model/user_model.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart%20%20';

import '../../../utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  //Save user record from registration provider

  Future<void> saveUserData(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final user = UserModel(id: userCredentials.user!.uid,
            fullName: userCredentials.user!.displayName ?? '' ,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        //Save user data
        await userRepository.saveUserData(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Data not saved',
          message:
          'Something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

}