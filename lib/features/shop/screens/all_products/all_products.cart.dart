import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/layout/grid_layout.dart';
import 'package:philately/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Popular Stamps'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// dropdown
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value){},
                items: ['High to Low','Low to High','Relevant'].map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option))).toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// products
              TGridLayout(itemCount: 8, itemBuilder: (_, index) => const TProductCardVertical(imageUrl: TImages.productImage1, title: 'Rare Stamp', price: '35\$', description: 'rare stamp', discount: '25% off',))
            ],
          ),
        ),
      ),
    );
  }
}
