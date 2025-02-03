import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good day for shopping', style: Theme.of(context).textTheme.labelMedium!.apply(color: AColors.grey),),
          Text('Raj Verma',style: Theme.of(context).textTheme.headlineSmall!.apply(color: AColors.white),),
        ],
      ),
    );
  }
}
