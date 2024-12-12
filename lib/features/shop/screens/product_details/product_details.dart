import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/texts/section_heading.dart';
import 'package:philately/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:philately/features/shop/screens/product_details/widgets/product_detail_image.dart';
import 'package:philately/features/shop/screens/product_details/widgets/product_price_stock.dart';
import 'package:philately/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:philately/features/shop/screens/prpduct_reviews/product_reviews.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(
        productPrice: 60.0,
        productName: 'Indian stamp',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image
            const TProductImagesl(),

            /// Product details
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share
                  const TRatingAndShare(),

                  /// Price, stock
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwSections / 1.85),

                  /// Checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This stunning vintage stamp showcases the elegance of a red poinsettia...',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(const ProductReview()),
                        icon: const Icon(Iconsax.arrow_right_3),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
