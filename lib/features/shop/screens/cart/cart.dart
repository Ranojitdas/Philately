import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philately/features/shop/screens/cart/widgets/cart_controller.dart';
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

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetching CartController using Get.find
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: const BackButton(),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }
        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final item = cartController.cartItems[index];
            return ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text(item.name),
              subtitle: Obx(() => Text(
                  'Price: \$${item.price}, Quantity: ${item.quantity.value}')),
              trailing: Obx(() => Text(
                  'Total: \$${(item.price * item.quantity.value).toStringAsFixed(2)}')),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: cartController.cartItems.isNotEmpty
                ? () => Get.to(() => const CheckOutScreen())
                : null,
            child: Text(
              'Checkout \$${cartController.totalPrice.value.toStringAsFixed(2)}',
            ),
          ),
        );
      }),
    );
  }
}


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
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Coupon
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections,),

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
            child: const Text('Checkout \$1500.0'),)
      ),
    );
  }
}

