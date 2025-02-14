
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? AColors.dark : AColors.white,
      padding: EdgeInsets.all(TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Have a Promo Code ? '
                      'Enter Here',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 24, color: AColors.black),
                  border: InputBorder.none
              ),
            ),
          ),

          ///Button
          ElevatedButton(onPressed: (){}, child: Text('Apply'),style: ElevatedButton.styleFrom(
              foregroundColor:  dark ? Colors.white.withOpacity(0.5) : AColors.dark.withOpacity(0.5),
              backgroundColor: AColors.grey.withOpacity(0.2),
              side: BorderSide(color: AColors.grey.withOpacity(0.1))
          ),)
        ],
      ),
    );
  }
}