import 'package:e_commerce_user/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              // Add spacing manually
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 24, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Add spacing between fields

              Text(
                'Email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              // Add spacing manually
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
              const SizedBox(height: 12),
              // Add spacing between fields

              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              // Add spacing manually
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: 'Enter your Phone Number',
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
                obscureText: true,
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
          TermsAndCondition(),

          const SizedBox(
            height: 32 / 1.5,
          ),

          ///SignUp Button
          SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: dark ? Colors.white : Colors.black,
                      foregroundColor: dark ? AColors.dark : Colors.white,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    'Create an Account',
                  ))),
        ],
      ),
    );
  }
}

