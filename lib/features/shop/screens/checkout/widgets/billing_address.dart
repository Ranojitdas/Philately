import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philately/common/widgets/texts/section_heading.dart';
import 'package:philately/utils/constants/sizes.dart';

class TBillingAddress extends StatelessWidget {
  const TBillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){},),
        Text('Ranojit Das',style: Theme.of(context).textTheme.bodyLarge,),
SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('+91 1234567890',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('Bardhaman, WB 711005 , India',style: Theme.of(context).textTheme.bodyMedium,)),
          ],
        ),
      ],
    );
  }
}
