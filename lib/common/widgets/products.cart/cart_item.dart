import 'package:flutter/material.dart';
import 'package:philately/common/widgets/images_banner/t_rounded_banner_image.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/helpers/helper_functions.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        Flexible(
          child: TRoundedImage(
            imageUrl: TImages.productImage1,
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // const TProductTitleText(title: 'Indian Independence Day Stamp ', maxLines: 1,),
            Text('Indian Independence Day Stamp ', maxLines: 1,style: Theme.of(context).textTheme.bodyLarge,),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Quality ',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'New ',style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Available ',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Yes ',style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: '                       ',style: Theme.of(context).textTheme.bodyLarge),
                    ]
                )
            )
          ],
        )
      ],
    );
  }
}