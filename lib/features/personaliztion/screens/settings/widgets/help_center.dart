import 'package:e_commerce_user/features/personaliztion/controller/help_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelpCenterController());
    return Scaffold(
      appBar: const CustomAppbar(title: Text("Help Center")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.helpCenterFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.emailController,
                  readOnly: true, // prevents editing
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
                const SizedBox(height: TSizes.spaceBtwItems),
                TextFormField(
                  controller: controller.subjectController,
                  decoration: InputDecoration(
                    hintText: 'Please enter a subject',
                    labelStyle: const TextStyle()
                        .copyWith(fontSize: 24, color: AColors.black),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AColors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a subject' : null,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TextFormField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    hintText: 'Please describe your issue',
                    labelStyle: const TextStyle()
                        .copyWith(fontSize: 24, color: AColors.black),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AColors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 5,
                  validator: (value) =>
                      value!.isEmpty ? 'Please describe your issue' : null,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.saveHelpCenterForm(),
                    child: const Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
