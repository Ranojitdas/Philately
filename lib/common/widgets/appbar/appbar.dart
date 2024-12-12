import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/device/device_utility.dart';
import 'package:philately/utils/helpers/helper_functions.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Padding(padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: ()=> Get.back(), icon: Icon(Iconsax.arrow_left,color: dark ? TColors.white : TColors.dark,))
            : leadingIcon != null ?  IconButton(onPressed: leadingOnPressed, icon: const Icon(Iconsax.arrow_left)) : null,
            title: title,
            actions:actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
