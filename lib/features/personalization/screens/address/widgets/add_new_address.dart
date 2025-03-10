import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/utils/constants/sizes.dart';

class AddNewAddresss extends StatelessWidget {
  const AddNewAddresss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
       child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
       child: Form(
         child: Column(
           children: [
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),),
             const SizedBox(height: TSizes.spaceBtwInputFields,),
             TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),),
             const SizedBox(height: TSizes.spaceBtwInputFields,),
             Row(
               children: [
                 Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.house), labelText: 'Street'),)),
                 const SizedBox(height: TSizes.spaceBtwInputFields,),
                 Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.location), labelText: 'Postal Code '),)),
               ],
             ),
             const SizedBox(height: TSizes.spaceBtwInputFields,),
             Row(
               children: [
                 Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),)),
                 const SizedBox(height: TSizes.spaceBtwInputFields,),
                 Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.map5), labelText: 'State'),)),
               ],
             ),
             const SizedBox(height: TSizes.spaceBtwInputFields,),
             TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),),
             const SizedBox(height: TSizes.defaultSpace,),
             SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Save')),),
           ],
         ),
       ),),
      ),
    );
  }
}
