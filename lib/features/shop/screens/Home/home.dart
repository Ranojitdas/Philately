import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philately/features/shop/screens/Home/widgets/home_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images_banner/t_rounded_banner_image.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products.cart/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/controllers.onboarding/signup/signup_controller.dart';
import '../all_products/all_products.cart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> productData = [
    {
      'imageUrl': TImages.productImage1,
      'title': 'Indian Independence Stamp',
      'price': '35',
      'description': 'Indian stamp',
      'discount': '25',
      'category': 'Philately News',
    },
    {
      'imageUrl': TImages.productImage2,
      'title': 'Mahatma Gandhi Stamp',
      'price': '50',
      'description': 'Gandhi stamp',
      'discount': '15',
      'category': 'Mint Commemorative Stamps',
    },
    {
      'imageUrl': TImages.productImage3,
      'title': 'Historic Indian Coin',
      'price': '80',
      'description': 'Indian coin collection',
      'discount': '10',
      'category': 'Exhibitions',
    },
    {
      'imageUrl': TImages.productImage4,
      'title': 'Freedom Fighters Stamp',
      'price': '60',
      'description': 'For freedom fighters',
      'discount': '20',
      'category': 'First Day Covers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());

    return Scaffold(
      body: Obx(() {
        // Filter products based on selected preferences
        final selectedPreferences = signupController.selectedPreferences;
        final filteredProductData = selectedPreferences.isEmpty
            ? productData
            : productData
            .where((product) =>
            selectedPreferences.contains(product['category']))
            .toList();

        // Dynamic title and default to a generic title if no preferences
        final sectionTitle = selectedPreferences.isEmpty
            ? 'Mint Commemorative Stamps'
            : 'Your Preferences: ${selectedPreferences.join(", ")}';

        return SingleChildScrollView(
          child: Column(
            children: [
              const TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    TSearchContainer(text: 'Search Stamps & Collections'),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TRoundedImage(imageUrl: TImages.promoBanner3),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(
                      title: sectionTitle,
                      onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    TGridLayout(
                      itemCount: filteredProductData.length,
                      itemBuilder: (_, index) {
                        final product = filteredProductData[index];
                        return TProductCardVertical(
                          imageUrl: product['imageUrl'] ?? TImages.productImage5,
                          title: product['title'] ?? 'Unknown Product',
                          price: product['price'] ?? '0',
                          description: product['description'] ??
                              'No description available',
                          discount: product['discount'] ?? '0',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
