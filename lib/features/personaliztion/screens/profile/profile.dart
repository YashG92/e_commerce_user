import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/images/circular_image.dart';
import 'package:e_commerce_user/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/personaliztion/controller/user_controller.dart';
import 'package:e_commerce_user/features/personaliztion/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_user/features/personaliztion/screens/profile_edit/change_name.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///profile picture Change Section

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
                TextButton(
                    onPressed: () => controller.uploadUserProfilePicture(),
                    child: Text('Change Profile Picture')),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                Divider(),

                ///Profile Information

                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Profile_Menu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () {
                    Get.to(() => ChangeName());
                  },
                ),
                Profile_Menu(
                  title: 'UserName',
                  value: controller.user.value.fullName,
                  onPressed: () {},
                ),
                Divider(),

                ///Personal Information Section

                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Profile_Menu(
                    title: 'User ID',
                    value: controller.user.value.id,
                    icon: Iconsax.copy,
                    onPressed: () {}),
                Profile_Menu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onPressed: () {},
                ),
                Profile_Menu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {},
                ),
                Profile_Menu(
                  title: 'Gender',
                  value: 'Male',
                  onPressed: () {},
                ),
                Profile_Menu(
                  title: 'Date of Birth',
                  value: '09-12-2002',
                  onPressed: () {},
                ),
                Divider(),

                ///Delete Account
                TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
