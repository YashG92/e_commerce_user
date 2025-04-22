import 'package:flutter/material.dart';
import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../controller/user_controller.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final TextEditingController emailController = TextEditingController(
      text: controller.user.value.email,
    );
    return Scaffold(
      appBar: const CustomAppbar(title: Text("Help Center")),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
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
                controller: subjectController,
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
                controller: messageController,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Handle form submission (e.g., send to Firestore or email)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Request submitted")),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
