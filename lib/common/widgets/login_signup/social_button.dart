import 'package:e_commerce_user/features/authentication/controller/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helper/helper_functions.dart';

class SocialButton extends StatelessWidget {
  final String buttonTitle;
  const SocialButton({
    super.key, required this.buttonTitle,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                elevation: 0,
                foregroundColor: dark ? Colors.white : Colors.black,
                side: const BorderSide(color: AColors.grey),
                textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: ()=>controller.googleSignIn(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      height: 32 * 1.5,
                      width: 32 * 1.5,
                      image: AssetImage(ImageStrings.googleLogo)),
                  Text(
                    buttonTitle,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
