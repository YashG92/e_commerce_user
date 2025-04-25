import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user/features/personaliztion/model/address_model.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';

import '../../../utils/constants/enums.dart';
import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final double shippingCost;
  final AddressModel? shippingAddress;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    required this.shippingCost,
    this.paymentMethod = 'GPay',
    this.shippingAddress,
    this.deliveryDate,
  });

  String get formattedOrderDate => HelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? HelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText {
    switch (status) {
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.shipped:
        return 'Order is shipped';
      case OrderStatus.processing:
        return 'Order is processing';
      case OrderStatus.pending:
        return 'Order is pending';
      case OrderStatus.cancelled:
        return 'Order is cancelled';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'shippingCost': shippingCost,
      'shippingAddress': shippingAddress?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      status: OrderStatus.values
          .firstWhere((status) => status.toString() == data['status']),
      totalAmount: data['totalAmount'] as double,
      shippingCost: data['shippingCost'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      shippingAddress:
          AddressModel.fromMap(data['shippingAddress'] as Map<String, dynamic>),
      deliveryDate: data['deliveryDate'] != null
          ? (data['deliveryDate'] as Timestamp).toDate()
          : null,
      items: (data['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
