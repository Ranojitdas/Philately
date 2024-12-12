import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:philately/common/widgets/icons/t_circular_icon.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/image_strings.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/helpers/helper_functions.dart';


class TProductImagesl extends StatelessWidget {
  const TProductImagesl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedWidgets(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: const Stack(
          children: [
            /// Large Image

            SizedBox(height: 400,child: Padding(
              padding: EdgeInsets.all(TSizes.productImageRadius*2),
              child: Center(child: Image(image: AssetImage(TImages.productImage5))),
            ),
            ),
            /// Appbar icons
            TAppbar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )

          ],
        ),
      ),
    );
  }
}
