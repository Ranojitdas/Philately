import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:philately/utils/constants/text_strings.dart';
import 'package:philately/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: const AssetImage(TImages.deliveredEmailIllustration),width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBtwSections,),


              ///Title and Subtitle

              Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),

              const SizedBox(height : TSizes.spaceBtwSections),
              ///Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){},child: const Text(TTexts.done),),),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){},child: const Text(TTexts.resendEmail),),),


            ],
          ),
        ),
      ),
    );
  }
}
