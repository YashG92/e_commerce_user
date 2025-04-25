import 'package:e_commerce_user/features/authentication/controller/login/login_controller.dart';
import 'package:e_commerce_user/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_user/utils/validator/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
  final controller = Get.put(LoginController());

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
                'Email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6), // Add spacing manually
              TextFormField(
                controller: controller.email,
                validator: (value)=> Validator.validateEmail(value),
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
                ()=> TextFormField(
                  controller: controller.password,
                  validator: (value)=>Validator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: ()=>controller.hidePassword.value = !controller.hidePassword.value, icon: controller.hidePassword.value? const Icon(Iconsax.eye_slash) :const Icon(Iconsax.eye)),
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

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    ()=> Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) {
                        controller.rememberMe.value = !controller.rememberMe.value;
                      },
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  const Text('Remember Me'),
                ],
              ),
              TextButton(
                onPressed: () =>Get.to(()=> const ForgetPassword()),
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

                  onPressed: ()=>controller.signInWithEmailPassword(),
                  child: const Text(
                    'Login',
                  )))
        ],
      ),
    );
  }
}
