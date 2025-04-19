import 'package:e_commerce_user/bindings/general_bindings.dart';
import 'package:e_commerce_user/routes/app_routes.dart';
import 'package:e_commerce_user/splash_screen.dart';
import 'package:e_commerce_user/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      title: 'VY Store',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      getPages: AppRoutes.pages,
      home: const SplashScreen(),
    );
  }
}
