import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/constants/text_strings.dart';
import 'package:philately/utils/helpers/helper_functions.dart';
import 'package:philately/utils/validators/validation.dart';

import '../../../../shop/screens/checkout/widgets/checkout2.dart';
import '../../../controllers.onboarding/signup/signup_controller.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First name', value),
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last name', value),
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: controller.userName,
            validator: (value) => TValidator.validateEmptyText('User name', value),
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Mailing Address
          TextFormField(
            controller: controller.mailing,
            validator: (value) => TValidator.validateEmptyText('Mailing Address', value),
            decoration: const InputDecoration(
              labelText: TTexts.mailing,
              prefixIcon: Icon(Iconsax.building),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Aadhar No
          TextFormField(
            controller: controller.aadhar,
            validator: (value) => TValidator.validateEmptyText('Aadhar no.', value),
            decoration: const InputDecoration(
              labelText: TTexts.aadhar,
              prefixIcon: Icon(Iconsax.card_receive),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.sms),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          Obx(
                () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          // Terms and Conditions Dropdown
          Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: controller.selectedPreferences.isEmpty
                      ? null
                      : controller.selectedPreferences.first, // Use the first selected preference
                  onChanged: (newValue) {
                    if (newValue != null) {
                      controller.togglePreference(newValue); // Add or remove the preference
                    }
                  },
                  items: [
                    'Philately News',
                    'Exhibitions',
                    'New Releases',
                    'Cancellation',
                    'Mint Commemorative Stamps',
                    'Mint Definitive Stamps',
                    'First Day Covers',
                    'Information Brochure',
                    'Postal Stationary'
                  ]
                      .map((String preference) {
                    return DropdownMenuItem<String>(
                      value: preference,
                      child: Text(preference),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Select Preferences',
                    prefixIcon: Icon(Iconsax.filter),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Privacy Policy and Terms Acceptance
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Obx(
                      () => Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${TTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: TTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: '${TTexts.and} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: TTexts.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckOutScreen2()),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
