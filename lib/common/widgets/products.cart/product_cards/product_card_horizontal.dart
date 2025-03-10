import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:philately/common/widgets/icons/t_circular_icon.dart';
import 'package:philately/common/widgets/images_banner/t_rounded_banner_image.dart';
import 'package:philately/common/widgets/texts/product_price_text.dart';
import 'package:philately/common/widgets/texts/product_title_text.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/shadows.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
    color:  dark ? TColors.darkGrey : TColors.softGrey,
    ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child:  Stack(
              children: [
                /// Thumbnail Image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: TImages.productImage1,applyImageRadius: true,),
                ),

                /// Sale tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                    child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),

                /// Favourite icon
                const Positioned(
                  top: 0 ,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
                )
              ],
            ),
          ),
          
          
          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Indian Independence Stamp',smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems/2,),

                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: TProductPriceText(price: '256.0')),

                      /// Add to Cart
                      Container(
                        decoration:  const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(TSizes.productImageRadius)
                            )
                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white,))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
