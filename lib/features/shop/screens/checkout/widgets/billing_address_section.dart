import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yash G',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: TSizes.sm / 2,
            ),
            Text(
              '+91 7698409883',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: TSizes.sm / 2,
            ),
            Text(
              '404 flat apartment society area city pincode india',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            //  style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}
