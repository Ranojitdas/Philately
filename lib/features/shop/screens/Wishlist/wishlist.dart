import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/icons/t_circular_icon.dart';
import 'package:philately/common/widgets/layout/grid_layout.dart';
import 'package:philately/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:philately/features/shop/screens/Home/home.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to( HomeScreen()), ),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder: (_, index) =>  const TProductCardVertical(imageUrl: TImages.productImage5, title: 'Floral Stamp', price: '50\$', description: 'Japan Stamps', discount: '10% off',))
            ],
          ),
        ),
      ),
    );
  }
}
