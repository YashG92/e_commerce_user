import 'package:e_commerce_user/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/search_container.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Appbar
                  HomeAppBar(),

                  /// Searchbar
                  SizedBox(height: TSizes.spaceBtwSections,),
                  SearchContainer(text: "Search for Store",),
                  /// Categories
                  SizedBox(height: TSizes.spaceBtwSections,),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///Heading
                        SectionHeading(title: 'Popular Categories', showActionButton: false,textColor: AColors.white,),
                        SizedBox(height: TSizes.spaceBtwItems,),

                        ///Categories
                        HomeCategories(),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







