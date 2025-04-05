import 'package:e_commerce_user/features/shop/controllers/product/product_variations_controller.dart';
import 'package:e_commerce_user/utils/helper/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ProductVariationsController());
  }

}