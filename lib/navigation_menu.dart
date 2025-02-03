import 'package:e_commerce_user/features/shop/screens/home/home.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            backgroundColor: dark ? AColors.black : Colors.white,
            indicatorColor: dark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.1),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.search_normal), label: 'Search'),
              NavigationDestination(icon: Icon(Iconsax.heart), label: 'Saved'),
              NavigationDestination(
                  icon: Stack(children: [
                    Icon(Iconsax.shopping_cart),
                    Positioned(
                        right: 0,

                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AColors.black.withOpacity(0.5)),
                          child: Center(

                              child: Text(
                            '2',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: AColors.white,fontSizeFactor: 0.8),
                          )),
                        ))
                  ]),
                  label: 'Cart'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Account'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    Container(
      color: Colors.teal,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.lightGreenAccent,
    ),
    Container(
      color: Colors.pinkAccent,
    ),
  ];
}
