import 'package:cloud_firestore/cloud_firestore.dart';

class CouponModel {
  String code;
  String discountType;
  double discountValue;
  double minimumOrderValue;
  bool isActive;
  DateTime expiryDate;

  CouponModel({
    required this.code,
    required this.discountType,
    required this.discountValue,
    required this.minimumOrderValue,
    required this.isActive,
    required this.expiryDate,
  });

  // Empty constructor
  static CouponModel empty() => CouponModel(
        code: '',
        discountType: '',
        discountValue: 0.0,
        minimumOrderValue: 0.0,
        isActive: true,
        expiryDate: DateTime.now(),
      );

  //Discount type formatter
  static String discountTypeFormatted(discountType) {
    switch (discountType) {
      case "DiscountType.percentage":
        return 'Percentage';
      case "DiscountType.amount":
        return 'Amount';
      default:
        return '';
    }
  }

  factory CouponModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CouponModel(
        code: data['code'] ?? '',
        discountType: data['discountType'] ?? 'DiscountType.amount',
        // Default fallback
        discountValue: (data['discountValue'] as num).toDouble(),
        minimumOrderValue: (data['minimumOrderValue'] as num).toDouble(),
        isActive: data['isActive'] ?? false,
        expiryDate: (data['expiryDate'] as Timestamp).toDate(),
      );
    } else {
      return CouponModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'discountType': discountType,
      'discountValue': discountValue,
      'minimumOrderValue': minimumOrderValue,
      'isActive': isActive,
      'expiryDate': expiryDate,
    };
  }
}
