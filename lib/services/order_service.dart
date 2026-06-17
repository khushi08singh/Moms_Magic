import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/dish.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> placeOrder({
    required List<Dish> items,
    required double totalAmount,
  }) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    // 🔹 Convert cart items to map
    final orderItems = items.map((dish) {
      return {
        'name': dish.name,
        'price': dish.price,
        'quantity': 1, // (later cart quantity add karenge)
      };
    }).toList();

    // 🔥 Save order to Firestore
    await _firestore.collection('orders').add({
      'userId': user.uid,
      'userEmail': user.email,
      'items': orderItems,
      'totalAmount': totalAmount,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });

    print("✅ Order placed successfully");
  }
}
