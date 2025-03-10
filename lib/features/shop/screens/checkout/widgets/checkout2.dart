import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:philately/common/widgets/Success_screen/success_screen.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:philately/common/widgets/products.cart/coupon_card.dart';
import 'package:philately/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:philately/features/shop/screens/checkout/widgets/billing_address.dart';
import 'package:philately/features/shop/screens/checkout/widgets/billing_amount.dart';
import 'package:philately/features/shop/screens/checkout/widgets/billing_payments.dart';
import 'package:philately/navigation_menu.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/helpers/helper_functions.dart';

import '../../../../authentication/controllers.onboarding/signup/signup_controller.dart';
import 'billing_amount2.dart';

class CheckOutScreen2 extends StatelessWidget {
  const CheckOutScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [


              /// Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black :TColors.white,
                child: Column(
                  children: [
                    Text("Registration fee",style: Theme.of(context).textTheme.headlineSmall,),
                    const SizedBox(height: TSizes.spaceBtwItems,
                    ),
                    /// Pricing
                    const TBillingAmount2(),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                    /// Payment Methods
                    const TBillingPayment(),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    /// Address
                    const TBillingAddress(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(
            image: TImages.successfulPaymentIcon, title: 'Payment Sucess', subTitle: 'You Succesfully paid for the registration fees of your NPDA account', onPressed: () => controller.signup(),
          ),
          ),
            child: const Text('Checkout 236.0  ₹'),)
      ),
    );
  }
}
