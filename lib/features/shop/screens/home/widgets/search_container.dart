import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, required this.text, this.icon = Iconsax.search_normal,  this.showBackground = true,  this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.all(TSizes.md),
      width:MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: showBackground? dark ? AColors.dark :  Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
        border:showBorder ?  Border.all(color: Colors.grey) : null,
      ),
      child: Row(
        children: [
          Icon(icon,color: Colors.grey,),
          SizedBox(width: TSizes.spaceBtwItems,),
          Text(text,style: Theme.of(context).textTheme.bodySmall,),
        ],
      ),
    );
  }
}
