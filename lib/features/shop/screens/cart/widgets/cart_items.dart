import 'package:flutter/material.dart';
import 'package:philately/common/widgets/products.cart/add_remove_button.dart';
import 'package:philately/common/widgets/products.cart/cart_item.dart';
import 'package:philately/common/widgets/texts/product_price_text.dart';
import 'package:philately/utils/constants/sizes.dart';


class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.showAddRemove =true,
  });

  final bool showAddRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections,),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart item
          const TCartItem(),
          if(showAddRemove) const SizedBox(height: TSizes.spaceBtwItems,),

          if(showAddRemove) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  SizedBox(width: 90,),
                  ///Add remove button
                  TProductAddRemove(),
                ],
              ),

              /// Product Price
              TProductPriceText(price: '350'),
            ],
          )
        ],
      ),
    );
  }
}
