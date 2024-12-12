import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/features/authentication/screens/password/reset_password.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///HEADING
          Text(TTexts.forgetPasswordTitle , style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(TTexts.forgetPasswordSubTitle , style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: TSizes.spaceBtwSections * 2,),


          ///Text fields
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.sms) ,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),

          ///Submit button
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(TTexts.submit))),
        ],
      ),
      ),
    );
  }
}
