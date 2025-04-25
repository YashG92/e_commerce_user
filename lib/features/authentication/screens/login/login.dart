import 'package:e_commerce_user/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_user/common/widgets/login_signup/form_header.dart';
import 'package:e_commerce_user/features/authentication/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/form_footer.dart';
import '../../../../common/widgets/login_signup/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Scrollable content
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: kToolbarHeight,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title & Subtitle
                    FormHeader(
                      title: "Login to your account",
                      subTitle: 'It’s great to see you again.',
                    ),
                    SizedBox(height: 32),

                    /// Form
                    LoginForm(),

                    /// Divider
                    FormDivider(),

                    /// Social Login Button
                    SocialButton(buttonTitle: 'Login with Google'),

                    // Add some spacing before the scrollable content ends
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),

          /// Fixed bottom footer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormFooter(
              footerText: 'Don’t have an account?',
              onTap: () => Get.to(() => const SignupScreen()),
              buttonText: 'Join',
            ),
          ),
        ],
      ),
    );
  }
}