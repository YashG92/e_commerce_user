import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty){
        throw 'User not found';
      }
      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      final orders = result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
      orders.sort((a, b) => b.orderDate.compareTo(a.orderDate));
      return orders;
    } catch (e) {
      throw 'Something went wrong while fetching orders.Try again later.';
    }
  }

  Future<void> placeOrder(OrderModel order,String userId) async {
    try {
      final placedOrder = await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
      await _db.collection('Orders').doc(placedOrder.id).set(order.toJson());
    } catch (e) {
      throw 'Something went wrong while placing order.Try again later.';
    }
  }
}
