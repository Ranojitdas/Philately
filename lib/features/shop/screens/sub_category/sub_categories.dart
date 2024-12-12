import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/images_banner/t_rounded_banner_image.dart';
import 'package:philately/common/widgets/products.cart/product_cards/product_card_horizontal.dart';
import 'package:philately/common/widgets/texts/section_heading.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text('Popular'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            TRoundedImage(imageUrl: TImages.promoBanner3,width: double.infinity,applyImageRadius: true,),
            SizedBox(height: TSizes.spaceBtwSections,),

            /// Sub Categories
            Column(
              children: [
                /// Heading
                TSectionHeading(title: 'Popular Stamps',onPressed: (){},),
                const SizedBox(height: TSizes.spaceBtwItems/2,),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index)=> const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const TProductCardHorizontal()),
                ),
              ],
            )
          ],
        ),),
      ),
    );
  }
}
