import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';

class HomeSearchController extends GetxController {
  static HomeSearchController get instance => Get.find();

  final RxString query = ''.obs;
  List<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> searchedProducts = <ProductModel>[].obs;
  final isLoading = false.obs;

  Future<void> onSearch(String newQuery) async {
    query.value = newQuery;
    if(newQuery.trim().isEmpty){
      searchedProducts.clear();
      return;
    }
    isLoading.value = true;

    if(query.value.length >= 2){
      try {
        if(allProducts.isEmpty){
            allProducts = await ProductRepository.instance.getAllProducts();
        }
        searchedProducts.value = allProducts.where((product){
          final titleMatch = product.title.toLowerCase().contains(query.value.toLowerCase());
          final descriptionMatch = product.description!.toLowerCase().contains(query.value.toLowerCase());
          final brandMatch = product.brand!.name.toLowerCase().contains(query.value.toLowerCase());
          return titleMatch || descriptionMatch || brandMatch;
        }).toList();
      }catch (e) {
        Loaders.warningSnackBar(title: e.toString());
      }finally{
        isLoading.value = false;
      }
    }else{
      searchedProducts.clear();
      isLoading.value = false;
    }

  }

}
