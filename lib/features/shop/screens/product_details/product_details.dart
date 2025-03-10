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
                    title: 'Origins',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This red poinsettia stamp was first issued to capture the vibrant beauty and cultural symbolism of the poinsettia, a flower long associated with the holiday season. The design reflects the festive spirit and the rich tradition of using floral imagery in stamps. Originating in the 20th century, it quickly became a beloved collectible for philatelists and holiday enthusiasts alike.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),/// Description

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(
                    title: 'Significance',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  const ReadMoreText(
                    'This vintage stamp captures the timeless elegance of a red poinsettia, a symbol often linked to the holiday season and the rich cultural history of the association with Christmas traditions.',
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
