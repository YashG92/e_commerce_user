import 'package:e_commerce_user/data/repositories/product/product_repository.dart';
import 'package:e_commerce_user/features/shop/models/product_model.dart';
import 'package:e_commerce_user/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8));
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    }finally{
      isLoading.value = false;
    }
  }
  ///Load selected category data
  Future<List<CategoryModel>> getSubCategory(String categoryId)async{
    try {
      final categories = await _categoryRepository.getSubCategories(categoryId);
      return categories;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }

  ///Get Category or Sub Categories Products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId,int limit = 4}) async{
    try {
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId,limit: limit);
      return products;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }
}
