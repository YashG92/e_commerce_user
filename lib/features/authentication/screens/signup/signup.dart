import 'package:e_commerce_user/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_user/common/widgets/login_signup/form_footer.dart';
import 'package:e_commerce_user/common/widgets/login_signup/social_button.dart';
import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:e_commerce_user/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/form_header.dart';
import '../../../../utils/helper/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormHeader(
                      title: 'Create an account',
                      subTitle: 'Let’s create your account.',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SignUpForm(dark: dark),
                    FormDivider(),
                    SocialButton(
                      buttonTitle: 'Sign Up with Google',
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormFooter(
              footerText: 'Already have an account?',
              onTap: () => Get.to(() => LoginScreen()),
              buttonText: 'Log In',
            ),
          ),
        ],
      ),

    );
  }
}
