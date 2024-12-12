// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philately/features/authentication/screens/login/Widgets/TSocialButtons.dart';
import 'package:philately/features/authentication/screens/signup/widgets/SignUp_Form.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/constants/text_strings.dart';
import 'package:philately/utils/helpers/helper_functions.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ///Divider
              TFormDivider(dividerText : TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///Social buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class TFormDivider extends StatelessWidget {
  const TFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5,indent: 60, endIndent: 5,),),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5,indent: 5, endIndent: 60,),),
      ],
    );
  }
}
