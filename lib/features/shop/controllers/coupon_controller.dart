import 'package:e_commerce_user/data/repositories/coupon/coupon_repository.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/coupon_model.dart';

class CouponController extends GetxController {
  static CouponController get instance => Get.find();

  final _couponRepository = Get.put(CouponRepository());
  final TextEditingController couponCode = TextEditingController();
  Rxn<CouponModel> appliedCoupon = Rxn<CouponModel>();
  RxBool isLoading = false.obs;
  final isCouponEntered = false.obs;

  void onCouponTextChanged(String value) {
    isCouponEntered.value = value.trim().isNotEmpty;
  }

  Future<void> applyCoupon(String code) async {
    try {
      isLoading.value = true;

      final List<CouponModel> allCoupons =
          await _couponRepository.getAllCoupons();

      final coupon = allCoupons.firstWhereOrNull(
          (coupon) => coupon.code.toLowerCase() == code.toLowerCase());

      if(coupon == null){
        Loaders.errorSnackBar(title: 'Invalid',message: 'Coupon not found');
        isLoading.value = false;
        return;
      }

      final now = DateTime.now();
      if(!coupon.isActive){
        Loaders.errorSnackBar(title: 'Inactive', message: 'This coupon is not active.');
        isLoading.value = false;
        return;
      }

      if (coupon.expiryDate.isBefore(now)) {
        Loaders.errorSnackBar(title: 'Expired', message: 'This coupon has expired.');
        isLoading.value = false;
        return;
      }

      appliedCoupon.value = coupon;
      isLoading.value = false;
      Loaders.successSnackBar(title: 'Success', message: 'Coupon applied successfully.');
    } catch (e) {
      isLoading.value = false;
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Calculate discount
  double calculateDiscount(double subtotal) {
    final coupon = appliedCoupon.value;
    if (coupon == null || subtotal < coupon.minimumOrderValue) return 0.0;

    if (coupon.discountType.contains('percentage')) {
      return subtotal * (coupon.discountValue / 100);
    } else {
      return coupon.discountValue;
    }
  }
}
