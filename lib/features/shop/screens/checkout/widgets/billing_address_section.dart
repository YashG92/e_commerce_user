import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/features/personaliztion/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Column(
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () =>controller.selectNewAddressPopup(context),
        ),
        Obx(
          ()=> controller.selectedAddress.value.id.isNotEmpty? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.selectedAddress.value.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              Text(
                controller.selectedAddress.value.phoneNumber,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              Text(
                controller.selectedAddress.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              //  style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ) : const Text('Select Address'),
        ),
      ],
    );
  }
}
