import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:e_commerce_user/utils/validator/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../controller/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          'Add new Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
              child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                validator: (value)=> Validator.validateEmptyText('Name', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.user),
                  labelText: 'Name',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 18, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                controller: controller.phoneNumber,
                validator: (value)=> Validator.validateEmptyText('Phone Number', value),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.mobile),
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 18, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        validator: (value)=> Validator.validateEmptyText('Street', value),
                        controller: controller.street,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.building_31),
                      labelText: 'Street',
                      labelStyle: const TextStyle()
                          .copyWith(fontSize: 18, color: AColors.black),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                    validator: (value)=> Validator.validateEmptyText('Pincode', value),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.code),
                      labelText: 'Pincode',
                      labelStyle: const TextStyle()
                          .copyWith(fontSize: 18, color: AColors.black),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        controller: controller.city,
                    validator: (value)=> Validator.validateEmptyText('City', value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.building),
                      labelText: 'City',
                      labelStyle: const TextStyle()
                          .copyWith(fontSize: 18, color: AColors.black),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller.state,
                      validator: (value)=> Validator.validateEmptyText('State', value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.activity),
                        labelText: 'State',
                        labelStyle: const TextStyle()
                            .copyWith(fontSize: 18, color: AColors.black),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: AColors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                controller: controller.country,
                validator: (value)=> Validator.validateEmptyText('Country', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.global),
                  labelText: 'Country',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 18, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: dark ? Colors.white : Colors.black,
                      foregroundColor: dark ? AColors.dark : Colors.white,
                      textStyle:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () => controller.addNewAddress(),
                  child: const Text('Save'),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
