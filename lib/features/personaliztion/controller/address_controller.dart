import 'package:e_commerce_user/common/widgets/loaders/full_screen_loader.dart';
import 'package:e_commerce_user/data/repositories/address/address_repository.dart';
import 'package:e_commerce_user/features/personaliztion/screens/address/add_new_address.dart';
import 'package:e_commerce_user/utils/constants/image_strings.dart';
import 'package:e_commerce_user/utils/helper/cloud_helper_functions.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/network_manager.dart';
import '../model/address_model.dart';
import '../screens/address/widgets/single_address.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  // Form controllers
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final addressFormKey = GlobalKey<FormState>();

  // Reactive variables
  final refreshData = true.obs;
  final selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  @override
  void onInit() {
    super.onInit();
    // Load initial selected address
    loadSelectedAddress();
  }

  Future<void> loadSelectedAddress() async {
    try {
      final addresses = await getAllUserAddresses();
      final selected = addresses.firstWhere(
            (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      selectedAddress.value = selected;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Address Error', message: e.toString());
    }
  }

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      return await addressRepository.fetchUserAddresses();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Show loading
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Unselect current address if one is selected
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
          selectedAddress.value.id,
          false,
        );
      }

      // Select new address
      await addressRepository.updateSelectedField(
        newSelectedAddress.id,
        true,
      );

      // Update local state
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      selectedAddress.refresh(); // Force UI update

      Get.back(); // Close loading dialog
    } catch (e) {
      Get.back(); // Close loading dialog
      Loaders.errorSnackBar(
        title: 'Error in Selecting Address',
        message: e.toString(),
      );
    }
  }

  Future<void> addNewAddress() async {
    try {
      FullScreenLoader.openLoadingDialog(
        'Saving Address...',
        ImageStrings.loadingAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Validate Form
      if (!addressFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Create new address
      final newAddress = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        postalCode: postalCode.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
        selectedAddress: true, // New address is selected by default
      );

      // Add to repository
      final id = await addressRepository.addAddress(newAddress);
      newAddress.id = id;

      // Select the new address
      await selectAddress(newAddress);

      // Update UI
      refreshData.toggle();
      resetFormFields();

      FullScreenLoader.stopLoading();
      Loaders.successSnackBar(
        title: 'Success',
        message: 'Address added successfully',
      );

      if (Get.context != null && Navigator.canPop(Get.context!)) {
        Navigator.of(Get.context!).pop();
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeading(
                  title: 'Select Address',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                FutureBuilder(
                  future: getAllUserAddresses(),
                  builder: (_, snapshot) {
                    final response = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                    );
                    if (response != null) return response;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => SingleAddress(
                        address: snapshot.data![index],
                        onTap: () async {
                          await selectAddress(snapshot.data![index]);
                          if (Get.context != null && Navigator.canPop(Get.context!)) {
                            Navigator.of(Get.context!).pop();
                          }
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: TSizes.defaultSpace * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddressScreen()),
                    child: const Text('Add new address'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}