import 'package:e_commerce_user/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_user/data/repositories/user/user_repository.dart';
import 'package:e_commerce_user/features/shop/models/payment_method_model.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loaders.dart';
import '../../../personaliztion/model/settings_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  final Rx<SettingsModel> settings = SettingsModel().obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Razoy Pay', image: ImageStrings.razorPayLogo);
    fetchSettingDetails();
  }

  Future<void> fetchSettingDetails() async {
    try {
      settings.value = await UserRepository.instance.getGlobalSettings();
    } catch (e) {
      Future.delayed(Duration.zero, () {
        Loaders.errorSnackBar(
            title: 'Something went wrong', message: e.toString());
      });
    }
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Razor Pay', image: ImageStrings.razorPayLogo)),
            ],
          ),
        ),
      ),
    );
  }
}
