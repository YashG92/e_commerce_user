import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? Theme.of(context).scaffoldBackgroundColor : Colors.white,
      child: TabBar(

          tabAlignment: TabAlignment.start,
          isScrollable: true,
          indicatorColor: AColors.primary,
          unselectedLabelColor: AColors.darkGrey,
          labelColor: dark ? AColors.white: AColors.primary,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
