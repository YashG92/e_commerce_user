import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/widgets/rating_process_indicator.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and review are verified and are from people who use the same type of device that you use.'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///overall product rating
              const OverallProductRating(),
              const ARatingBarIndicator(
                rating: 4.6,
              ),
              Text(
                '1,200',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///user review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
