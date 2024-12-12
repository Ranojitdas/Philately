import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:philately/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  /// Update Current Index When Page scroll

  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update current Index and jump to next page

  void nextPage() {
    if(currentPageIndex.value == 2){
      final storage = GetStorage();

      if(kDebugMode){
        print('======================== GET STORAGE Next Button ====================');
        print(storage.read('IsFirstTime'));
      }
      storage.write('IsFirstTime', false);

      if(kDebugMode){
        print('======================== GET STORAGE Next Button ====================');
        print(storage.read('IsFirstTime'));
      }

      Get.offAll(const LoginScreen());
    }
    else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current Index and jump to the last page

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }




}