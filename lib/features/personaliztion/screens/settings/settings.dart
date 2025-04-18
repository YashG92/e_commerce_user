import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_user/common/widgets/images/circular_image.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_user/features/personaliztion/screens/address/address.dart';
import 'package:e_commerce_user/features/personaliztion/screens/settings/widgets/setting_menu_tile.dart';
import 'package:e_commerce_user/features/personaliztion/screens/settings/widgets/user_profile.dart';
import 'package:e_commerce_user/features/shop/screens/order/order.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Account',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            UserProfile(),

            //SizedBox(height: TSizes.spaceBtwSections/2,),
            ///body Listview
            Column(
              children: [
                ///Account Settings
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

                SettingMenuTile(
                  title: 'My Orders',
                  icon: Iconsax.box,
                  showDivider: false,
                  onTap: ()=> Get.to(()=> OrderListScreen()),
                ),
                Divider(
                  thickness: 10,
                  color: dark? AColors.darkerGrey : AColors.grey,
                ),

                SettingMenuTile(
                  title: 'Address Book',
                  icon: Iconsax.home,
                  onTap: () => Get.to(() => UserAddressScreen()),
                ),
                SettingMenuTile(
                  title: 'Payment Methods',
                  icon: Iconsax.card,
                ),
                SettingMenuTile(
                  title: 'Account',
                  icon: Iconsax.user,
                ),
                SettingMenuTile(
                  title: 'My Coupons',
                  icon: Iconsax.discount_shape,
                  showDivider: false,
                ),
                Divider(
                  thickness: 10,
                  color: dark? AColors.darkerGrey : AColors.grey,
                ),
                SettingMenuTile(
                  title: 'FAQs',
                  icon: Iconsax.discount_shape,
                ),
                SettingMenuTile(
                  title: 'Help Center',
                  icon: Iconsax.discount_shape,
                  showDivider: false,
                ),
                Divider(
                  thickness: 10,
                  color: dark? AColors.darkerGrey : AColors.grey,
                ),
                SettingMenuTile(
                  title: 'Logout',
                  icon: Iconsax.logout,
                  showDivider: false,
                  showColor: true,
                  showNextArrow: false,
                  onTap: ()=>AuthenticationRepository.instance.logoutUser(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
