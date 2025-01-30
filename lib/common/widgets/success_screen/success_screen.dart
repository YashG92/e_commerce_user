import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, this.onPressed});

  final String image, title , subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Image
            Lottie.asset(image),
            ///Title & SubTitle
            Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwItems,),
            Text(subTitle,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwSections,),
            ///Buttons

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
                  onPressed: onPressed, child: Text('Continue')),),

          ],
        ),
      ),
    );
  }
}
