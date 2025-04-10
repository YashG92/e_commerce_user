import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/cloud_helper_functions.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controllers/product/order_controller.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    final dark = HelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: orderController.fetchUserOrders(),
        builder: (context, snapshot) {
          final emptyWidget = AnimationLoaderWidget(
            text: 'Oops!, No Orders Yet!',
            animation: ImageStrings.loadingAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (widget != null) return widget;

          final orders = snapshot.data!;

          return ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            itemCount: orders.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final order = orders[index];
              return RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? AColors.dark : AColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      ///Row-1
                      children: [
                        ///Icon 1
                        const Icon(Iconsax.ship),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),

                        ///Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: AColors.primary,
                                        fontWeightDelta: 1),
                              ),
                              Text(
                                order.formattedOrderDate,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),

                        ///Icon 2
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Iconsax.arrow_right_34,
                              size: TSizes.iconSm,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Row-2
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              ///Icon 1
                              const Icon(Iconsax.tag),
                              const SizedBox(
                                width: TSizes.spaceBtwItems / 2,
                              ),

                              ///Status & Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .apply(
                                              color: AColors.primary,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(
                                      order.id,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              ///Icon 1
                              const Icon(Iconsax.calendar),
                              const SizedBox(
                                width: TSizes.spaceBtwItems / 2,
                              ),

                              ///Status & Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .apply(
                                              color: AColors.primary,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(
                                      order.formattedDeliveryDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
