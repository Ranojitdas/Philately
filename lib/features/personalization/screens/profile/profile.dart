import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:philately/common/widgets/texts/section_heading.dart';
import 'package:philately/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text('Profile',style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: true,
      ),
      /// body
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child:
                /// Profile Picture
                Column(
                  children: [
                    const TCircularImages(image: TImages.user, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
            ),
            /// Details
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),

            /// Heading Profile
            const TSectionHeading(title: 'Profile Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            
            
            TProfileMenu(onPressed: () {}, title: 'Name', value: 'Ranojit Das',),
            TProfileMenu(onPressed: () {}, title: 'Username', value: 'ranojit',),

            const SizedBox(height: TSizes.spaceBtwItems,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),

            /// Personal Info
            const TSectionHeading(title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            TProfileMenu(onPressed: (){}, title: 'User Id', value: '101',icon: Iconsax.copy,),
            TProfileMenu(onPressed: (){}, title: 'Email', value: 'ranojitdas362@gmail.com'),
            TProfileMenu(onPressed: (){}, title: 'Phone Number', value: '+918637008441'),
            TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
            TProfileMenu(onPressed: (){}, title: 'Date of Birth', value: '31 oct 2004'),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),

            Center(
              child: TextButton(
                onPressed: (){},
                child: const Text('Close Account',style: TextStyle(color: Colors.red),),
              ),
            )
          ],
        ),),
      ),
    );
  }
}
