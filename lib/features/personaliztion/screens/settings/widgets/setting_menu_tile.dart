import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile(
      {super.key,
      this.showColor = false,
      required this.title,
      required this.icon,
      this.onTap,
      this.showDivider = true,  this.showNextArrow = true,
      });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool showDivider;
  final bool showColor;
  final bool showNextArrow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 28,
            color: showColor ? Colors.red :  AColors.primary,
          ),
          title: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: showColor ? Colors.red : null)),
          trailing: showNextArrow ?  Icon(Iconsax.arrow_right_3) : null,
          onTap: onTap,
        ),
        if (showDivider)
          Divider(
            indent: 60,
            endIndent: 25,
          ),
      ],
    );
  }
}
