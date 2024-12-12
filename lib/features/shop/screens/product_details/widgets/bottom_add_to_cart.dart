import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philately/features/shop/screens/cart/widgets/cart_controller.dart';

class TBottomAddToCart extends StatelessWidget {
  final String productName;
  final double productPrice;

  const TBottomAddToCart({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => cartController.removeItem(productName, productPrice),
                child: const Icon(Icons.remove, color: Colors.black),
              ),
              const SizedBox(width: 16),
              Obx(() {
                final item = cartController.cartItems
                    .firstWhereOrNull((item) => item.name == productName);
                return Text(
                  '${item?.quantity.value ?? 0}',
                  style: Theme.of(context).textTheme.headlineSmall,
                );
              }),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => cartController.addItem(productName, productPrice),
                child: const Icon(Icons.add, color: Colors.black),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              cartController.addItem(productName, productPrice);
              Get.snackbar("Cart Updated", "$productName added to cart!");
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
