// // // lib/providers/cart_provider.dart
// // import 'package:flutter/foundation.dart';
// // import 'package:moms_magic/pages/dishespage.dart';
// //
// //
// // class CartItem {
// //   final Dish dish;
// //   int qty;
// //   CartItem({required this.dish, this.qty = 1});
// // }
// //
// // class CartProvider extends ChangeNotifier {
// //   final List<CartItem> _items = [];
// //
// //   List<CartItem> get items => List.unmodifiable(_items);
// //
// //   void addDish(Dish dish) {
// //     final idx = _items.indexWhere((c) => c.dish.name == dish.name);
// //     if (idx >= 0) {
// //       _items[idx].qty += 1;
// //     } else {
// //       _items.add(CartItem(dish: dish, qty: 1));
// //     }
// //     notifyListeners();
// //   }
// //
// //   void removeDish(Dish dish) {
// //     _items.removeWhere((c) => c.dish.name == dish.name);
// //     notifyListeners();
// //   }
// //
// //   void changeQty(Dish dish, int delta) {
// //     final idx = _items.indexWhere((c) => c.dish.name == dish.name);
// //     if (idx >= 0) {
// //       _items[idx].qty += delta;
// //       if (_items[idx].qty <= 0) _items.removeAt(idx);
// //       notifyListeners();
// //     }
// //   }
// //
// //   double get total {
// //     double sum = 0;
// //     for (var c in _items) {
// //       sum += c.dish.price * c.qty;
// //     }
// //     return sum;
// //   }
// //
// //   void clear() {
// //     _items.clear();
// //     notifyListeners();
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import '../pages/dishespage.dart';
// import 'package:moms_magic/models/dish.dart'; // 👈 CORRECTED IMPORT for Dish model
//
// class CartProvider extends ChangeNotifier {
//   final List<Dish> _cart = [];
//
//   List<Dish> get cart => _cart;
//
//   void addToCart(Dish dish) {
//     _cart.add(dish);
//     notifyListeners();
//   }
//
//   void removeFromCart(Dish dish) {
//     _cart.remove(dish);
//     notifyListeners();
//   }
//
//   void clearCart() {
//     _cart.clear();
//     notifyListeners();
//   }
// }

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
