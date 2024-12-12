import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:philately/features/authentication/screens/login/login.dart';
import 'package:philately/features/authentication/screens/onboarding/onboarding.dart';
import 'package:philately/features/authentication/screens/signup/verify_email.dart';
import 'package:philately/navigation_menu.dart';
import 'package:philately/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:philately/utils/exceptions/firebase_exceptions.dart';
import 'package:philately/utils/exceptions/format_exceptions.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called  from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      }
     else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      } }
    else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get
          .offAll(() => const LoginScreen()) : Get.offAll(
          const OnBoardingScreen());
    }
  }

  /// Email and password


  /// signin/login

Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFireBaseAuthException(e.code).message;
    }
    on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong please try again';
    }
}

  /// register
  Future<UserCredential> registerWithEmailAndPassword(String email,
      String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }

  /// email verification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }














  /// LogOut user
    Future<void> logout() async {
      try {
        await FirebaseAuth.instance.signOut();
        Get.offAll(() => const LoginScreen());
      } on FirebaseAuthException catch (e) {
        throw TFireBaseAuthException(e.code).message;
      }
      on TFirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } on PlatformException catch (e) {
        throw TPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong please try again';
      }
    }
}