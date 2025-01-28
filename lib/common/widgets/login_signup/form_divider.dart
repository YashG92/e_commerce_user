import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helper/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32 / 1.5),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: dark ? AColors.darkGrey : AColors.grey,
              thickness: 2,
              indent: 5,
              endIndent: 5,
            ),
          ),
          Text(
            'Or',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontSize: 16),
          ),
          Expanded(
            child: Divider(
              color: dark ? AColors.darkGrey : AColors.grey,
              thickness: 2,
              indent: 5,
              endIndent: 5,
            ),
          ),
        ],
      ),
    );
  }
}
