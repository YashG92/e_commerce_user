import 'package:e_commerce_user/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_user/features/shop/controllers/product/product_variations_controller.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/constants/enums.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/local_storage/storage_utility.dart';
import '../../models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxDouble totalCartSalePrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final RxMap<String, ProductModel> productCache = <String, ProductModel>{}.obs;
  final variationController = ProductVariationsController.instance;
  final productController = ProductController.instance;

  CartController() {
    loadCartItems();
  }

  // Load products for all cart items
  Future<void> loadProductsForCart() async {
    try {
      for (var item in cartItems) {
        if (!productCache.containsKey(item.productId)) {
          final product = await productController.fetchProductById(item.productId);
          productCache[item.productId] = product;
        }
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error loading products', message: e.toString());
    }
  }


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

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

// Check if product already exists in cart
    final existingIndex = cartItems.indexWhere((cartItem) =>
    cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
      // Add to cache if not already present
      if (!productCache.containsKey(product.id)) {
        productCache[product.id] = product;
      }
    }

    updateCart();
    Loaders.customToast(message: 'Product added to cart');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ?  variation.price
        :  product.price;

    final salePrice = isVariation
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
      salePrice: salePrice,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
    loadProductsForCart();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    double calculatedTotalSalePrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedTotalSalePrice += (item.salePrice) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartSalePrice.value = calculatedTotalSalePrice;
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
      loadProductsForCart();
    }
  }

  int getProductsQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: 'Remove Item',
      middleText: 'Are you sure you want to remove this item from cart?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Loaders.customToast(message: 'Item removed from cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product){
    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductsQuantityInCart(product.id);
    }else{
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value = 0;
      }
    }
  }

}
