import 'package:flutter/material.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/text_strings.dart';


class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle , style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Text(TTexts.homeAppbarSubTitle , style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),)
        ],
      ),
      actions:[
        TCartCounterIcon(onPressed: (){}, iconColor: TColors.white,),
      ],

    );
  }
}