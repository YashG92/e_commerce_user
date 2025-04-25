import 'package:e_commerce_user/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/validator/validators.dart';
import '../../../controller/signup/signup_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.formKey,
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
                controller: controller.fullName,
                validator: (value) =>
                    Validator.validateEmptyText('Full Name', value),
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 24, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AColors.grey),
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
                controller: controller.email,
                validator: (value) => Validator.validateEmail(value),
                decoration: InputDecoration(
                  hintText: 'Enter your email address',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 24, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AColors.grey),
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
                controller: controller.phoneNumber,
                validator: (value) => Validator.validatePhoneNumber(value),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: 'Enter your Phone Number',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 24, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AColors.grey),
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
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => Validator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: controller.hidePassword.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye)),
                    hintText: 'Enter your password',
                    labelStyle: const TextStyle()
                        .copyWith(fontSize: 24, color: AColors.black),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AColors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const TermsAndCondition(),

          const SizedBox(
            height: 32 / 1.5,
          ),

          ///SignUp Button
          SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(
                    'Create an Account',
                  ))),
        ],
      ),
    );
  }
}
