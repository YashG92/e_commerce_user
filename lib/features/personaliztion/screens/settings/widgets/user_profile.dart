import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helper/helper_functions.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return ListTile(
      leading: const CircularImage(
        backgroundColor: AColors.white,
        image: ImageStrings.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Varis Kadri', style: Theme.of(context).textTheme.headlineSmall!.apply(color:dark? AColors.white : AColors.black ),),
      subtitle: Text('xyz@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color:dark? AColors.white : AColors.black ),),
      trailing: IconButton(onPressed: (){}, icon:  Icon(Iconsax.edit, color: dark? AColors.white : AColors.black ,)),
    );
  }
}
