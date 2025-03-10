import 'package:flutter/material.dart';
import 'package:philately/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:philately/features/shop/screens/prpduct_reviews/widgets/rating_barindicator.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.user),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('Shriyanshu Kumar', style: Theme.of(context).textTheme.titleLarge,),

              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov 2024',style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

         const ReadMoreText(
            "This stamp is a true gem for collectors! The intricate floral design and vibrant colors make it stand out, and the subtle cancellation marks add a fascinating touch of history. It's a perfect addition to my collection, and I couldn’t be happier with its quality.",
            trimLines: 2,
           trimMode: TrimMode.Line,
           trimExpandedText: ' show less',
           trimCollapsedText: 'show more',
           moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent),
           lessStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.blueAccent),
         ),
        SizedBox(height: TSizes.spaceBtwItems,),

        /// Company Review
        TRoundedContainer(
          backgroundColor: dark ? Colors.blueAccent : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Philatelix - Ranojit', style: Theme.of(context).textTheme.titleMedium,),
                    Text('11 dex 2024',style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItems,),

                const ReadMoreText(
                  "This stamp is a true gem for collectors! The intricate floral design and vibrant colors make it stand out, and the subtle cancellation marks add a fascinating touch of history. It's a perfect addition to my collection, and I couldn’t be happier with its quality.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  lessStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.blueAccent),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
