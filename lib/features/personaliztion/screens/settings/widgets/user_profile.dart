import 'package:e_commerce_user/features/personaliztion/controller/user_controller.dart';
import 'package:e_commerce_user/features/personaliztion/screens/profile/profile.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helper/helper_functions.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: TSizes.spaceBtwItems,),
        Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image =networkImage.isNotEmpty ? networkImage : ImageStrings.user;
          return controller.imageUploading.value ? ShimmerEffect(width: 80, height: 80,radius: 80,): CircularImage(
            image: image,
            width: 80,
            height: 80,
            isNetworkImage: networkImage.isNotEmpty,
          );
        }),
        Expanded(
          child: ListTile(
          
            title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color:dark? AColors.white : AColors.black ),),
            subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color:dark? AColors.white : AColors.black ),),
            trailing: IconButton(onPressed: ()=>Get.to(()=>const Profile()), icon:  Icon(Iconsax.edit, color: dark? AColors.white : AColors.black ,)),
          ),
        ),
      ],
    );
  }
}
