import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_user/features/personaliztion/screens/address/address.dart';
import 'package:e_commerce_user/features/personaliztion/screens/settings/widgets/faqs_screen.dart';
import 'package:e_commerce_user/features/personaliztion/screens/settings/widgets/help_center.dart';
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
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            const UserProfile(),

            //SizedBox(height: TSizes.spaceBtwSections/2,),
            ///body Listview
            Column(
              children: [
                ///Account Settings
                const Padding(
                  padding:  EdgeInsets.all(TSizes.defaultSpace),
                  child: SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

                SettingMenuTile(
                  title: 'My Orders',
                  icon: Iconsax.box,
                  showDivider: false,
                  onTap: ()=> Get.to(()=> const OrderListScreen()),
                ),
                Divider(
                  thickness: 10,
                  color: dark? AColors.darkerGrey : AColors.grey,
                ),

                SettingMenuTile(
                  title: 'Address Book',
                  icon: Iconsax.home,
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                const SettingMenuTile(
                  title: 'Payment Methods',
                  icon: Iconsax.card,
                ),
                const SettingMenuTile(
                  title: 'Account',
                  icon: Iconsax.user,
                ),
                const SettingMenuTile(
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
                  icon: Iconsax.info_circle,
                  onTap: ()=> Get.to(()=> const FAQsScreen()),
                ),
                SettingMenuTile(
                  title: 'Help Center',
                  icon: Iconsax.message_question,
                  showDivider: false,
                  onTap: ()=> Get.to(()=> const HelpCenterScreen()),
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
