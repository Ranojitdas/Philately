import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/helpers/helper_functions.dart';

class TLoaders{
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.darkGrey.withOpacity(0.9) : TColors.grey.withOpacity(0.9),
        ),
          child: Center(child: Text(message,style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }


  static successSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check,color: TColors.white,)
    );
  }

  static warningSnackBar({required title, message ='',duration =3}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2,color: TColors.white,)
    );
  }
  static errorSnackBar({required title, message =''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2,color: TColors.white,)
    );
  }


}