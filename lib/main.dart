import 'package:e_commerce_user/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_user/splash_screen.dart';
import 'package:e_commerce_user/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async{

  //Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //Init Local Storage
  await GetStorage.init();
  //Init payment methods
  //await splash screen
  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //initialize authentication



  runApp(const App());
}


