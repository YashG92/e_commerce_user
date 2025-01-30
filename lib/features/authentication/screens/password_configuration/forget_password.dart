import 'package:e_commerce_user/common/widgets/login_signup/form_header.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor,),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///Heading
                    FormHeader(title: 'Forgot password', subTitle: 'Enter your email for the verification process.'),
                
                    SizedBox(height: TSizes.spaceBtwSections,),
                    ///Text Field
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
                    SizedBox(height: TSizes.spaceBtwSections,),
                
                    ///Submit Button
                
                    
                  ],
                ),
              ),
            ),
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
                      'Send Code',
                    )))
          ],
        ),
      ),
    );
  }
}
