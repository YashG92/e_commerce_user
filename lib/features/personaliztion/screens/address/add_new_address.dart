import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
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
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 18, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 18, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.building_31),
                      labelText: 'Street',
                      labelStyle: const TextStyle()
                          .copyWith(fontSize: 18, color: AColors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.code),
                      labelText: 'Pincode',
                      labelStyle: const TextStyle()
                          .copyWith(fontSize: 18, color: AColors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.building),
                      labelText: 'City',
                      labelStyle: const TextStyle()
                          .copyWith(fontSize: 18, color: AColors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: 'State',
                        labelStyle: const TextStyle()
                            .copyWith(fontSize: 18, color: AColors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AColors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: 'Country',
                  labelStyle: const TextStyle()
                      .copyWith(fontSize: 18, color: AColors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
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
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text('Save'),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
