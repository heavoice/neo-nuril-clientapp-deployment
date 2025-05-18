import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get cartItems => _items;

  double get totalPrice {
    return _items.fold(
        0.0, (sum, item) => sum + (item.newPrice * item.quantity));
  }

  void addToCart(CartItem item) {
    final index = _items.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      // Item sudah ada, update quantity
      _items[index] = CartItem(
        id: _items[index].id,
        title: _items[index].title,
        imagePath: _items[index].imagePath,
        quantity: _items[index].quantity + item.quantity,
        oldPrice: _items[index].oldPrice,
        newPrice: _items[index].newPrice,
      );
    } else {
      // Item belum ada, tambahkan ke cart
      _items.add(item);
    }

    notifyListeners();
  }

  void removeSelectedItems(Set<String> selectedIds) {
    _items.removeWhere((item) => selectedIds.contains(item.id));
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
