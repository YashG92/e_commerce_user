import 'package:e_commerce_user/features/shop/screens/product_reviews/widgets/rating_process_indicator.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(
                  ImageStrings.user,
                )),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'Varis Kadri',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        ///Reviews
        Row(
          children: [
            ARatingBarIndicator(rating: 4),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 Aug, 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          'hsgfsuiheu iu uwi hfuih efh jjs s huuhu hkjgfhs  hkghjsk  hksghjkshkg khskhguh sk ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AColors.primary),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        ///Company Review
        RoundedContainer(
            backgroundColor: dark ? AColors.darkerGrey : AColors.grey,
            child: Padding(
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Microsoft",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "02 Aug 2024",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    'hsgfsuiheu iu uwi hfuih efh jjs s huuhu hkjgfhs  hkghjsk  hksghjkshkg khskhguh sk djfkhgkjhdfjgkh dfjshgjhdkjsfgh jkhfsdjkvbhfjkd jfehgjkhjkehg  kjfhjghjks ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: ' show less',
                    trimCollapsedText: ' show more',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AColors.primary),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AColors.primary),
                  ),
                ],
              ),
            ),),
        SizedBox(height: TSizes.spaceBtwSections,),

      ],
    );
  }
}
