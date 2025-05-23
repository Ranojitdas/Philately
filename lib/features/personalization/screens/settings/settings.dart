import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:philately/common/widgets/icons/t_circular_icon.dart';
import 'package:philately/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:philately/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:philately/common/widgets/texts/section_heading.dart';
import 'package:philately/data/repositories/authentication/authentication_repository.dart';
import 'package:philately/features/personalization/screens/address/address.dart';
import 'package:philately/features/shop/screens/cart/cart.dart';
import 'package:philately/features/shop/screens/order/order.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    TAppbar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),)),
                    const SizedBox(height: TSizes.spaceBtwSections,),

                    ///User Profile Card
                    const TUserProfileTile(),
                    const SizedBox(height: TSizes.spaceBtwSections,)
                  ],
            ),),
            
            /// Body
              Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
               child: Column(
                 children: [
                   /// Account Setting
                   const TSectionHeading(title: 'Account Settings',showActionButton: false,),
                   const SizedBox(height: TSizes.spaceBtwItems,),
                   TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery address',onTap: () => Get.to(() => const UserAddress()),),
                   TSettingsMenuTile(icon: Iconsax.shopping_bag, title: 'My Cart', subTitle: 'Add , remove products and move to checkout',onTap: () => Get.to(() => const CartScreen())),
                   TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed orders',onTap: () => Get.to(() => const OrderScreen())),
                   TSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Accounts', subTitle: 'Withdraw balance to registered bank account',onTap: (){},),
                   TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons',onTap: (){},),
                   TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message',onTap: (){},),
                   TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts',onTap: (){},),

                   /// App settings
                   const SizedBox(height: TSizes.spaceBtwSections,),
                   const TSectionHeading(title: 'App Settings', showActionButton: false,),
                   const SizedBox(height: TSizes.spaceBtwItems,),
                   const TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load data', subTitle: 'Upload data to your cloud firebase'),
                   TSettingsMenuTile(
                       icon: Iconsax.location, title: 'Geolocation', subTitle: 'Set recommendation based on location',
                     trailing: Switch(value: true,onChanged: (value){},),
                   ),
                   TSettingsMenuTile(
                     icon: Iconsax.security_user, title: 'Safe Mode', subTitle: 'Search result is safe for all ages',
                     trailing: Switch(value: false,onChanged: (value){},),
                   ),
                   TSettingsMenuTile(
                     icon: Iconsax.image, title: 'HD Image Quality', subTitle: 'Set image quality to be seen',
                     trailing: Switch(value: true,onChanged: (value){},),
                   ),
                   const SizedBox(height: TSizes.spaceBtwItems,),
                   SizedBox(
                     width: double.infinity,
                     child: OutlinedButton(
                       onPressed: () async {
                         await AuthenticationRepository.instance.logout();
                       },
                       child: const Text('Logout'),
                     ),
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
