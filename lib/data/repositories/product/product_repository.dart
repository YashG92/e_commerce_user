import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user/features/shop/models/cart_item_model.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await _db.collection('Products').get();
    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  Future<ProductModel> fetchProductsById(String id) async {
    try {
      final product = await _db.collection('Products').doc(id).get();
      return ProductModel.fromSnapshot(product);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      final result =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          .get();
      final result =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('brand.id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('brand.id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final productList = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      List<ProductModel> productList = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<List<ProductModel>> getFavoriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<ProductModel> getProductById(String productId) async {
    try {
      final snapshot = await _db.collection('Products').doc(productId).get();
      return ProductModel.fromSnapshot(snapshot);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<void> updateProductFields(
      String productId, Map<String, dynamic> fields) async {
    await _db.collection('Products').doc(productId).update(fields);
  }

  Future<void> updateProductStock(CartItemModel item) async {
    try {
      final product = await getProductById(item.productId);
      final updatedStock = product.stock - item.quantity;
      if (updatedStock >= 0) {
        await updateProductFields(
          product.id,
          {
            'stock': updatedStock,
            'soldQuantity': product.soldQuantity + item.quantity,
          },
        );
      } else {
        throw 'Out of Stock ${product.title}';
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<void> updateProductVariationStock(CartItemModel item) async {
    try {
      final product = await getProductById(item.productId);
      if (product.productVariations != null) {
        final variations = [...product.productVariations!];
        final variationIndex =
            variations.indexWhere((v) => v.id == item.variationId);

        if (variationIndex != -1) {
          final variation = variations[variationIndex];
          final updatedStock = variation.stock - item.quantity;
          if (updatedStock >= 0) {
            variations[variationIndex] = variation.copyWith(
              stock: updatedStock,
              soldQuantity: variation.soldQuantity + item.quantity,
            );

            await updateProductFields(
              product.id,
              {
                'productVariations': variations.map((v) => v.toJson()).toList(),
              },
            );
          } else {
            // First stop loading before throwing error
            FullScreenLoader.stopLoading();
            Loaders.warningSnackBar(title: 'Not enough stock for ${product.title} (${variation.attributeValues['Sizes'] ?? 'selected variation'})');
            throw 'Not enough stock for ${product.title} (${variation.attributeValues['Sizes'] ?? 'selected variation'})';
          }
        } else {
          FullScreenLoader.stopLoading();
          throw 'Product variation not found';
        }
      } else {
        FullScreenLoader.stopLoading();
        throw 'Product not found';
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }
}
