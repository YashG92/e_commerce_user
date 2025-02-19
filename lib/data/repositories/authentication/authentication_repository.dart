import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:e_commerce_user/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_user/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_user/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_user/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_user/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Function to show relevant screen

  screenRedirect() async {
    //local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => OnBoardingScreen());
  }

  ///Email auth SIGN IN
  ///Email auth REGISTER

  Future<UserCredential> registerWithEmailAndPassword(String email, String password)async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email ,password: password);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}
