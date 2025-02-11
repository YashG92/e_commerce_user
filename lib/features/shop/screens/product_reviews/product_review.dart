import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Review & Rating',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'vafhsbjdjs sjskjkjskjs skskskkskskksks ks sksssssssssksjffjjfj jsjsjsjjsjsjsjfkfkks'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///overall product rating
              OverallProductRating(),
              RatingBarIndicator(
                rating: 4.5,
                  itemSize: 20,
                  unratedColor: AColors.grey,
                  itemBuilder: (_, __) => Icon(
                        Iconsax.star1,
                        color: AColors.primary,
                      )),
              Text('1200',style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: TSizes.spaceBtwSections,),
              ///user review list
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
