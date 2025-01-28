import 'package:e_commerce_user/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_user/common/widgets/login_signup/form_header.dart';
import 'package:e_commerce_user/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/form_footer.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: kToolbarHeight,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title & Subtitle
              FormHeader(title: "Login to your account", subTitle: 'It’s great to see you again.',),
              const SizedBox(height: 32),

              /// Form
              LoginForm(),

              ///Divider
              FormDivider(),

              ///Footer

              SocialButton(buttonTitle: 'Login with Google',),
              FormFooter(footerText: 'Don’t have an account?',onTap: ()=> Get.to(()=>SignupScreen()),buttonText: 'Join',),
            ],
          ),
        ),
      ),
    );
  }
}





