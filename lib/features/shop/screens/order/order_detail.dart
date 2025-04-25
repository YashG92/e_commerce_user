import 'package:e_commerce_user/features/shop/models/order_model.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../common/widgets/texts/product_title_text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

import 'package:intl/intl.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final textTheme = Theme.of(context).textTheme;
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹');

    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Order ${order.id}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Order Status Card
            Card(
              elevation: 0,
              color: dark ? AColors.darkerGrey : AColors.light,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Status', style: textTheme.titleLarge),
                        Chip(
                          label: Text(
                            order.orderStatusText,
                            style: textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor:
                              HelperFunctions.getOrderStatusColor(order.status),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    _buildDetailRow(
                      context,
                      icon: Icons.calendar_today_outlined,
                      label: 'Order Date',
                      value: order.formattedOrderDate,
                    ),
                    _buildDetailRow(
                      context,
                      icon: Icons.local_shipping_outlined,
                      label: 'Expected Delivery',
                      value: order.formattedDeliveryDate,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Order Items
            Text('Order Items', style: textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),
            ...order.items.map((item) => Card(
                  color: dark ? AColors.darkerGrey : AColors.light,
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                    side: BorderSide(
                      color: dark ? AColors.darkerGrey : AColors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Row(
                      children: [
                        /// Product Image
                        RoundedImage(
                          imageUrl: item.image ?? '',
                          isNetworkImage: true,
                          height: 80,
                          width: 80,
                          backgroundColor:
                              dark ? AColors.darkGrey : AColors.light,
                          padding: const EdgeInsets.all(TSizes.sm),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),

                        /// Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: ProductTitleText(
                                      title: item.title,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    currencyFormat.format(item.price),
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),
                              BrandTitleWithVerifiedIcon(
                                  title: item.brandName ?? ''),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),

                              /// Product Variations
                              if (item.selectedVariation != null &&
                                  item.selectedVariation!.isNotEmpty)
                                Wrap(
                                  spacing: TSizes.spaceBtwItems / 2,
                                  runSpacing: TSizes.spaceBtwItems / 4,
                                  children: item.selectedVariation!.entries
                                      .map(
                                        (entry) => Chip(
                                          label: Text(
                                            '${entry.key}: ${entry.value}',
                                            style: textTheme.labelSmall,
                                          ),
                                          backgroundColor: dark
                                              ? AColors.darkGrey
                                              : AColors.light,
                                          side: BorderSide.none,
                                        ),
                                      )
                                      .toList(),
                                ),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),
                              Text(
                                'Qty: ${item.quantity}',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Order Summary
            Text('Order Summary', style: textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),
            Card(
              elevation: 0,
              color: dark ? AColors.darkerGrey : AColors.light,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    _buildSummaryRow(
                      context,
                      label: 'Subtotal',
                      value: currencyFormat.format(order.totalAmount),
                    ),
                    _buildSummaryRow(
                      context,
                      label: 'Shipping',
                      value: currencyFormat.format(order.shippingCost),
                    ),
                    const Divider(height: TSizes.spaceBtwSections),
                    _buildSummaryRow(
                      context,
                      label: 'Total',
                      value: currencyFormat.format(order.totalAmount),
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 2),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AColors.darkerGrey),
          const SizedBox(width: TSizes.spaceBtwItems),
          Text('$label: ', style: Theme.of(context).textTheme.bodyMedium),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context, {
    required String label,
    required String value,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            value,
            style: isTotal
                ? Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                : Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
