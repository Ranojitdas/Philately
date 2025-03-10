import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:philately/bindings/general_bindings.dart';
import 'package:philately/features/authentication/screens/onboarding/onboarding.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/theme/theme.dart';

/// -- use this class to setup themes , initial bindings and any animations

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular progress indicator while authentication repository deciding the screen
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
    );
  }




}