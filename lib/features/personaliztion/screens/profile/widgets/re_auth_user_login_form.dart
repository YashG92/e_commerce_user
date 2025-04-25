import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validator/validators.dart';
import '../../../controller/user_controller.dart';
class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User'),),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: Validator.validateEmail,
                decoration: InputDecoration(
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 18, color: AColors.black),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AColors.grey),
                      borderRadius: BorderRadius.circular(10),),
                    labelText: 'Email',),
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields,),

              ///Password
              Obx(
                    ()=> TextFormField(
                  validator: (value) => Validator.validatePassword(value),
                  controller: controller.verifyPassword,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon:  Icon(controller.hidePassword.value? Iconsax.eye_slash : Iconsax.eye),
                    ),
                    labelStyle: const TextStyle()
                        .copyWith(fontSize: 18, color: AColors.black),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AColors.grey),
                      borderRadius: BorderRadius.circular(10),)
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              const Spacer(),
              ///Login Button
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                  child: const Text('Verify'),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
