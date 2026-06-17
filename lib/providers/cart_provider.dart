import 'package:flutter/material.dart';
import '../models/dish.dart';

class CartProvider extends ChangeNotifier {
  final List<Dish> _items = [];

  // 🔹 GETTERS
  List<Dish> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  // 🔹 ADD TO CART
  void addToCart(Dish dish) {
    _items.add(dish);
    notifyListeners();
  }

  // 🔹 REMOVE FROM CART
  void removeFromCart(Dish dish) {
    _items.remove(dish);
    notifyListeners();
  }

  // 🔹 CLEAR CART (after order placed)
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
