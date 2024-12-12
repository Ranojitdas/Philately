import 'package:flutter/material.dart';
import 'package:philately/common/widgets/layout/grid_layout.dart';
import 'package:philately/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:philately/common/widgets/texts/section_heading.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/constants/image_strings.dart';

class TCategoryTab extends StatelessWidget {
  final String category;

  const TCategoryTab({
    super.key,
    required this.category,
  });

  // Example function to get product data based on the category
  List<Map<String, String>> getProductData() {
    switch (category) {
      case 'Popular':
        return [
          {'imageUrl': TImages.productImage1, 'title': 'Stamp 1', 'price': '20\$', 'description': 'Popular Stamp', 'discount': '10%'},
          {'imageUrl': TImages.productImage2, 'title': 'Stamp 2', 'price': '25\$', 'description': 'Popular Stamp', 'discount': '15%'},
          // Add more popular products...
        ];
      case 'Exclusive':
        return [
          {'imageUrl': TImages.productImage3, 'title': 'Stamp 3', 'price': '30\$', 'description': 'Exclusive Stamp', 'discount': '20%'},
          {'imageUrl': TImages.productImage4, 'title': 'Stamp 4', 'price': '40\$', 'description': 'Exclusive Stamp', 'discount': '25%'},
          // Add more exclusive products...
        ];
      case 'Cancellation':
        return [
          {'imageUrl': TImages.productImage2, 'title': 'Stamp 5', 'price': '50\$', 'description': 'Cancellation Stamp', 'discount': '30%'},
          {'imageUrl': TImages.productImage1, 'title': 'Stamp 6', 'price': '60\$', 'description': 'Cancellation Stamp', 'discount': '35%'},
          // Add more cancellation products...
        ];
      case 'Indian':
        return [
          {'imageUrl': TImages.productImage1, 'title': 'Stamp 7', 'price': '15\$', 'description': 'Indian Stamp', 'discount': '5%'},
          {'imageUrl': TImages.productImage2, 'title': 'Stamp 8', 'price': '18\$', 'description': 'Indian Stamp', 'discount': '10%'},
          // Add more Indian products...
        ];
      case 'WorldWide':
        return [
          {'imageUrl': TImages.productImage3, 'title': 'Stamp 9', 'price': '35\$', 'description': 'Worldwide Stamp', 'discount': '15%'},
          {'imageUrl': TImages.productImage4, 'title': 'Stamp 10', 'price': '40\$', 'description': 'Worldwide Stamp', 'discount': '20%'},
          // Add more worldwide products...
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = getProductData();

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(
                title: '$category Stamps for You',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return TProductCardVertical(
                    imageUrl: product['imageUrl']!,
                    title: product['title']!,
                    price: product['price']!,
                    description: product['description']!,
                    discount: product['discount']!,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
