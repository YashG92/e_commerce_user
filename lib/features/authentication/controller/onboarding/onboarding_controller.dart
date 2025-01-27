import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

//variable declare
      final pageController = PageController();
      Rx<int> currentPageIndex = 0.obs;
//Update current index when page scroll
      void updatePageIndex(index){
        currentPageIndex.value = index;
      }
//Update dot navigation
void dotNavigationClick(int index){
        currentPageIndex.value = index;
        pageController.jumpToPage(index);

}
//jump  to next page
void nextPage(){
      if(currentPageIndex.value==2){
        Get.to(()=> LoginScreen());
      }
      else{
        int nextPage = currentPageIndex.value+1;
        pageController.jumpToPage(nextPage);
      }
}
//jump to last page
  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
