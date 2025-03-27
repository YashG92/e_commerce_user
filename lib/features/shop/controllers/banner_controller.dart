import 'package:get/get.dart';

import '../../../data/repositories/banners/banner_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final currentIndex = 0.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index){
    currentIndex.value=index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final banners = await _bannerRepository.getAllBanners();

      this.banners.assignAll(banners);

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      isLoading.value = false;
    }finally{
      isLoading.value = false;
    }
  }
}