import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:philately/common/widgets/loaders/loaders.dart';
import 'package:philately/data/repositories/authentication/authentication_repository.dart';
import 'package:philately/utils/helpers/network_manager.dart';
import 'package:philately/utils/local_storage/storage_utility.dart';

class LoginController extends GetxController{

  ///variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();



  /// email and password signin
 Future<void> emailAndPasswordSign() async{
   try{
     // start loading
     // check internet connectivity

     final isConnected = await NetworkManager.instance.isConnected();
     // if(!isConnected) {
     //   TFullScreenLoader.stopLoading();
     //   return;
     // }

     // Form validation
     // if(!loginFormKey.currentState!.validate()) {
     //   TFullScreenLoader.stopLoading();
     // }

     // save data if Remember me is selected
     if(rememberMe.value){
       localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
       localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
     }
     // Login user using Email and password Authentication
     final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
     // TFullScreenLoader.stopLoading();

     // Redirect
     AuthenticationRepository.instance.screenRedirect();
   } catch(e){
     TLoaders.errorSnackBar(title:'Oh snap',message: e.toString() );
   }
 }
}