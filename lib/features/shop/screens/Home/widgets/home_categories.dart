import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philately/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:philately/features/shop/screens/sub_category/sub_categories.dart';
import 'package:philately/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // List of images for the categories
    final List<String> categoryImages = [
      TImages.indiaIcon, // Replace with the actual image paths
      TImages.worldIcon,    // Example images
      TImages.cancellationIcon,
      TImages.newIcon,
      TImages.rareIcon,
    ];

    final List<String> categoryTitles = [
      'Popular',
      'Trending',
      'New Arrivals',
      'Best Sellers',
      'Exclusive',
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: categoryImages[index],
            title: categoryTitles[index],
            onTap: () => Get.to(() => const SubCategories()),
          );
        },
      ),
    );
  }
}
