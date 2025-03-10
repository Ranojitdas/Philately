import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/styles/spacing_style.dart';
import 'package:philately/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:philately/features/authentication/screens/login/Widgets/TSocialButtons.dart';
import 'package:philately/features/authentication/screens/password/forget_password.dart';
import 'package:philately/features/authentication/screens/signup/signup.dart';
import 'package:philately/navigation_menu.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/constants/text_strings.dart';
import 'package:philately/utils/helpers/helper_functions.dart';
import 'package:philately/utils/validators/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image(image: AssetImage( dark ? TImages.lightAppLogo  : TImages.darkAppLogo ),height: 120 ,)) ,//image
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: TSizes.sm,),
                  Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,)
                ],
              ),

              ///form
              Form(
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                  child: Column(
                  children: [
                    ///email
                    TextFormField(
                      controller:controller.email,
                      validator: (value) => TValidator.validateEmail(value),
                      decoration: const InputDecoration( prefixIcon: Icon(Iconsax.sms), labelText: TTexts.email),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields,),
                    /// password
                    Obx(
                          () => TextFormField(
                        controller: controller.password,
                        validator: (value) => TValidator.validatePassword(value),
                        obscureText: controller.hidePassword.value,
                        decoration:  InputDecoration(
                          labelText: TTexts.password,
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                              icon : Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields / 2 ),

                    /// Remember me and forget password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Remember me
                        Row(
                          children: [
                            Obx(() => Checkbox(value: controller.rememberMe.value, onChanged:(value) => controller.rememberMe.value =!controller.rememberMe.value),
                            ),
                            const Text(TTexts.rememberMe),
                          ],
                        ),
                        /// Forget password
                        TextButton(onPressed:() => Get.to(() => const ForgetPassword())  , child: const Text(TTexts.forgetPassword)),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections,),

                    /// sign in button
                    SizedBox(width: double.infinity,
                        child: ElevatedButton(onPressed: ()=> controller.emailAndPasswordSign(), child: const Text(TTexts.signIn))),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                    /// Create Account button
                    SizedBox(width: double.infinity,child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()) , child: const Text(TTexts.createAccount))),
                  ],
                                ),
                ),
              ),

             ///DIVIDER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 60, endIndent:5 ,)),
                Text(TTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium,),
                Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 5, endIndent:60 ,)),
              ],
            ),
              const SizedBox(height: TSizes.spaceBtwSections,),

            /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ) ,
    );
  }
}

