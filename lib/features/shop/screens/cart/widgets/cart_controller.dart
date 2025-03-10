import 'package:get/get.dart';

class CartItem {
  final String name;
  final double price;
  RxInt quantity;

  CartItem({required this.name, required this.price, int quantity = 1})
      : quantity = RxInt(quantity);
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var totalPrice = 0.0.obs;

  void addItem(String name, double price) {
    final existingItem =
    cartItems.firstWhereOrNull((item) => item.name == name);

    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      cartItems.add(CartItem(name: name, price: price));
    }

    _updateTotalPrice();
  }

  void removeItem(String name, double price) {
    final existingItem =
    cartItems.firstWhereOrNull((item) => item.name == name);

    if (existingItem != null) {
      if (existingItem.quantity.value > 1) {
        existingItem.quantity--;
      } else {
        cartItems.remove(existingItem);
      }
      _updateTotalPrice();
    }
  }

  void _updateTotalPrice() {
    totalPrice.value =
        cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity.value));
  }
}
