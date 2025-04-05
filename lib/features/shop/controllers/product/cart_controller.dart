import 'package:e_commerce_user/features/shop/controllers/product/product_variations_controller.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/constants/enums.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = ProductVariationsController.instance;

  void addProductToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      Loaders.customToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      Loaders.customToast(message: 'Select Variation');
      return;
    }
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        Loaders.warningSnackBar(
            message: 'Selected variation is out of stock', title: 'Oh Snap!');
        return;
      }
    } else {
      if (product.stock < 1) {
        Loaders.warningSnackBar(
            message: 'Selected product is out of stock', title: 'Oh Snap!');
        return;
      }
    }
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }
}
