import 'package:flutter/material.dart';
import 'package:philately/utils/constants/sizes.dart';

class TBillingAmount2 extends StatelessWidget {
  const TBillingAmount2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium,),
            Text('200 ₹',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        // /// Shipping fee
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Shipping fee',style: Theme.of(context).textTheme.bodyMedium,),
        //     Text('\$6.0',style: Theme.of(context).textTheme.labelLarge,),
        //   ],
        // ),
        // const SizedBox(height: TSizes.spaceBtwItems/2,),

        /// Tax fee

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('36.0 ₹',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
            Text('236.0  ₹',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}
