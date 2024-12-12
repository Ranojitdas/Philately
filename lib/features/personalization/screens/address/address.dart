import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:philately/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:philately/features/personalization/screens/address/widgets/single_address.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/sizes.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: ()=> Get.to(() => const AddNewAddresss()),
        child: const Icon(Iconsax.add,color: TColors.white,),
        backgroundColor: TColors.primary,
      ),
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(selectedAddress: false),
              TSingleAddress(selectedAddress: true),
              TSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
