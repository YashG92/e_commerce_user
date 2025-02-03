import 'package:e_commerce_user/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce_user/features/shop/screens/home/widgets/search_container.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
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
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              itemCount: 6,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_,index){
                            return VerticalImageText(image: ImageStrings.sportIcon, title: 'Sport',onTapItem: (){},);
                          }),
                        )

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

class VerticalImageText extends StatelessWidget {

  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTapItem;

  const VerticalImageText({
    super.key, required this.image, required this.title, this.textColor=AColors.white, this.backgroundColor, this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTapItem,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              padding: EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? AColors.black : AColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(image),fit: BoxFit.cover, color: dark ? AColors.light : AColors.dark,),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems/2,),
            SizedBox(
                width: 55,
                child: Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),maxLines:1 ,overflow: TextOverflow.ellipsis,))
          ],
        ),
      ),
    );
  }
}





