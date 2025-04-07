import 'package:e_commerce_user/common/widgets/loaders/full_screen_loader.dart';
import 'package:e_commerce_user/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_user/data/repositories/user/user_repository.dart';
import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:e_commerce_user/features/personaliztion/model/user_model.dart';
import 'package:e_commerce_user/features/personaliztion/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart%20%20';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/helper/network_manager.dart';
import '../../../utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel
      .empty()
      .obs;
  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserData();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Save user record from registration provider

  Future<void> saveUserData(UserCredential? userCredentials) async {
    try {
      //Refresh user record
      await fetchUserRecord();

      // Save user data if not already present
      if (userCredentials != null) {
        final user = UserModel(
            id: userCredentials.user!.uid,
            fullName: userCredentials.user!.displayName ?? '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? ''
        );

        // Save user data to Firestore
        await userRepository.saveUserData(user);
        this.user(user); // Update the observable user model
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

  ///Delete warning popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
        'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                side: BorderSide(color: Colors.red)),
            onPressed: () async => deleteUserAccount(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )
        ),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: Text('Cancel'),)
    );
  }

  /// Re auth before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing', ImageStrings.loadingAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();

        return;
      }
      //Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();

        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Bad!', message: e.toString());
    }
  }

  ///Delete user account
  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing...', ImageStrings.loadingAnimation);

      //First re auth user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!
          .providerData
          .map((e) => e.providerId)
          .first;

      if (provider.isNotEmpty) {
        //Re verify email
        if (provider == 'google.com') {
          await GoogleSignIn().signOut();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => ReAuthenticateUserLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Bad!', message: e.toString());
    }
  }


  ///Upload profile picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      imageUploading.value = true;

      if (image != null) {
        final imageUrl = await userRepository.uploadImage(
            'Users/Images/Profile', image);

        //Update user image in json model
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleFieldUserData(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        Loaders.successSnackBar(title: 'Done', message: "Your profile has been updated");

      }
    }catch (e) {
      Loaders.errorSnackBar(title: 'Oh Bad!', message: e.toString());

    }finally{}
    imageUploading.value = false;
  }

    }






