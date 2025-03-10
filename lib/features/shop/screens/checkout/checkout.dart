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

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              /// Items in Cart
              const TCartItems(showAddRemove: false,),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// Coupon
              TCouponCode(),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// Billing Section
              TRoundedContainer(
                  showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black :TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                   TBillingAmount(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// Payment Methods
                    TBillingPayment(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    /// Address
                    TBillingAddress(),
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
            image: TImages.successfulPaymentIcon, title: 'Payment Sucess', subTitle: 'Your Stamp will be shipped soon', onPressed: () => Get.offAll(() => const NavigationMenu()),
    ),
    ),
    child: Text('Checkout \$1500.0'),)
    ),
    );
  }
}
