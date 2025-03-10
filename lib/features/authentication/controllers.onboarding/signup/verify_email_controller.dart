import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:philately/common/widgets/Success_screen/success_screen.dart';
import 'package:philately/common/widgets/loaders/loaders.dart';
import 'package:philately/data/repositories/authentication/authentication_repository.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

/// send email whenever verify screen appears
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
 /// send email verification link
    sendEmailVerification() async {
        try{
          await AuthenticationRepository.instance.sendEmailVerification();
          TLoaders.successSnackBar(title: 'Email sent',message:'Please check your inbox and verify your email.');
        } catch(e){
          TLoaders.errorSnackBar(title: 'Email not verified for your philately account', message:e.toString() );
        }
    }
///  timer to automatically redirect on email verification
      setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(
                () => SuccessScreen(
            image: TImages.staticSuccessIllustration, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle, onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
        );
       }
    } ,);
      }
///  manually check if email verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
          () => SuccessScreen(
              image: TImages.staticSuccessIllustration, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle, onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
      );
    }
  }

}