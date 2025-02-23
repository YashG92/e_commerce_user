import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/features/personaliztion/controller/update_name_controller.dart';
import 'package:e_commerce_user/features/personaliztion/controller/user_controller.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/validator/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppbar(
        title: Text('Edit Profile',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
              key: controller.updateUserNameFormKey,
                child: Column(
              children: [
                  TextFormField(
                    controller: controller.fullName,
                  validator: (value)=> Validator.validateEmptyText('Full Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    hintText: 'Enter your full name',
                    labelStyle: const TextStyle()
                        .copyWith(fontSize: 24, color: AColors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AColors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: TSizes.spaceBtwSections,),
                SizedBox(height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: ()=> controller.updateFullName(),
                      child: Text(
                        'Save',
                      ))
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
