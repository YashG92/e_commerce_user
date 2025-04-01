import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/enums.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  ///Get the product price or price range for variations
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    //If no variation exist, return the single price or sale
    if (product.productType == ProductType.single.toString() ||
        product.productVariations!.isEmpty) {
      return (product.salePrice > 0.0 ? product.salePrice : product.price)
          .toString();
    } else {
      //Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        //Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      //If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  ///Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  ///Check product stock status
  String getProductStockStatus(ProductModel product) {
    return product.stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
