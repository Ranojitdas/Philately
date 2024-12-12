import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/features/shop/screens/prpduct_reviews/product_reviews.dart';
import 'package:philately/features/shop/screens/prpduct_reviews/widgets/overall_product_rating.dart';
import 'package:philately/features/shop/screens/prpduct_reviews/widgets/rating_barindicator.dart';
import 'package:philately/features/shop/screens/prpduct_reviews/widgets/review_progessbar.dart';
import 'package:philately/features/shop/screens/prpduct_reviews/widgets/user_review_card.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/device/device_utility.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar
      appBar: const TAppbar(title: Text('Reviews and Ratings'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and Reviews are verified and are from Well-known Philatelists and peoples.'),
              const SizedBox(height: TSizes.spaceBtwItems,),
              
              ///Overall Product Ratings
              const OverAllProductRating(),
              const TRatingBarIndicator(rating: 4.8,),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// User Reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}
