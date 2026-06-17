import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/dish.dart';

class DishService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Dish>> fetchAllDishes() async {
    final snapshot = await _firestore.collection('dishes').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Dish(
        name: data['name'],
        image: data['image'],
        price: (data['price'] as num).toDouble(),
        rating: (data['rating'] as num).toDouble(),
        ratingCount: data['ratingcount'],
        category: data['category'],
      );
    }).toList();
  }
}
