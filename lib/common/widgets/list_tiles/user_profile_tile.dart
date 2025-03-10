import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:philately/common/widgets/icons/t_circular_icon.dart';
import 'package:philately/features/personalization/screens/profile/profile.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';


class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImages(
        image : TImages.user, width : 50 , height : 50 , padding : 0,
      ),
      title: Text('Ranojit Das', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('ranojitdas362@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: ()=> Get.to(const ProfileScreen()), icon: const Icon(Iconsax.edit , color: TColors.white,),),
    );
  }
}

class TCircularImages extends StatelessWidget {
  const TCircularImages({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.padding = 0.0, // Default padding is 0
  });

  final String image; // Path to the image asset
  final double width;
  final double height;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipOval(
        child: Image.asset(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover, // Cover the entire circular area
        ),
      ),
    );
  }
}