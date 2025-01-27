import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to your account',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8), // Add spacing manually
                  Text(
                    'It’s great to see you again.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              /// Form
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 6), // Add spacing manually
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email address',
                            labelStyle: const TextStyle()
                                .copyWith(fontSize: 24, color: AColors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AColors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12), // Add spacing between fields

                    /// Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 6), // Add spacing manually
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Iconsax.eye_slash),
                            hintText: 'Enter your password',
                            labelStyle: const TextStyle()
                                .copyWith(fontSize: 24, color: AColors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AColors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// Remember Me & Forget Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                              visualDensity: VisualDensity.compact,
                            ),
                            const Text('Remember Me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32 / 1.5,
                    ),

                    ///Login Button
                    SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    dark ? Colors.white : Colors.black,
                                foregroundColor:
                                    dark ? AColors.dark : Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              'Login',
                            )))
                  ],
                ),
              ),

              ///Divider
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32 / 1.5),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: dark ? AColors.darkGrey : AColors.grey,
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      'Or',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    Expanded(
                      child: Divider(
                        color: dark ? AColors.darkGrey : AColors.grey,
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                  ],
                ),
              ),

              ///Footer

              Column(
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: dark ? Colors.white : Colors.black,
                          side: BorderSide(color: AColors.grey),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                height: 32 * 1.5,
                                width: 32 * 1.5,
                                image: AssetImage(ImageStrings.googleLogo)),
                            Text(
                              'Login with Google',
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 16),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        'Join',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
