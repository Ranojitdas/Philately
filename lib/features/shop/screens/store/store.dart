import 'package:flutter/material.dart';
import 'package:philately/common/widgets/appbar/TabBar.dart';
import 'package:philately/common/widgets/appbar/appbar.dart';
import 'package:philately/common/widgets/appbar/category_tab.dart';
import 'package:philately/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:philately/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:philately/utils/constants/colors.dart';
import 'package:philately/utils/constants/sizes.dart';
import 'package:philately/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: TAppbar(
          title: Text(
            'Collections',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 180,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: 'Search Stamps',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Popular')),
                    Tab(child: Text('Exclusive')),
                    Tab(child: Text('Cancellation')),
                    Tab(child: Text('Indian')),
                    Tab(child: Text('WorldWide')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(category: 'Popular'),
              TCategoryTab(category: 'Exclusive'),
              TCategoryTab(category: 'Cancellation'),
              TCategoryTab(category: 'Indian'),
              TCategoryTab(category: 'WorldWide'),
            ],
          ),
        ),
      ),
    );
  }
}
