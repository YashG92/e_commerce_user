import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:e_commerce_user/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_user/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_user/navigation_menu.dart';
import 'package:e_commerce_user/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_user/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_user/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_user/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Function to show relevant screen

  screenRedirect() async {
    //local storage

    final user = _auth.currentUser;
    if(user!=null){
      if(user.emailVerified){
        Get.offAll(()=>NavigationMenu());
      } else{Get.offAll(()=>VerifyEmailScreen(email: _auth.currentUser?.email));}
    }else{
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }

  }

  ///Email auth SIGN IN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password)async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email ,password: password);
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
  ///email verification
 Future<void> sendEmailVerification()async {
    try{
      await _auth.currentUser?.sendEmailVerification();
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

    ///signin with google
   Future<UserCredential?> googleSignIn()async {
     try{
       //Trigger auth flow
       final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

       //getting auth details from request
       final GoogleSignInAuthentication? googleAuth= await userAccount?.authentication;

       //Create a new credentials
       final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);
       return await _auth.signInWithCredential(credential);
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
     return null;

   }



 Future<void> logoutUser()async{
   try{
     await GoogleSignIn().signOut();
     await _auth.signOut();
     Get.offAll(()=> LoginScreen());
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
