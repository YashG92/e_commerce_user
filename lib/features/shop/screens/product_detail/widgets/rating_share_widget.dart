import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2.5,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '4.0',
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                      decoration: TextDecoration.underline,
                      fontWeightDelta: 3)),
              TextSpan(
                  text: '/5.0',
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                      decoration: TextDecoration.underline,
                      fontWeightDelta: 3)),
              TextSpan(
                  text: ' (45 reviews)',
                  style: Theme.of(context).textTheme.bodyLarge),
            ])),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              size: TSizes.iconMd,
              color: dark ? AColors.white : AColors.black,
            )),
      ],
    );
  }
}
