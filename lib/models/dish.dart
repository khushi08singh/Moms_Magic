

// lib/models/dish.dart

class Dish {
  final String name;
  final String image;
  final double price;
  final String? desc;

  // 🌟 NEW FIELDS FOR RATING FEATURE 🌟
  // Note: These are optional fields, initialized to a default state.
  final double rating;
  final int ratingCount; // How many people rated this dish

  final String category;

  // 👈 FIX 1: Add 'const' here
  const Dish({
    required this.name,
    required this.image,
    required this.price,
    this.desc,
    // Default values set here
    this.rating = 0.0,
    this.ratingCount = 0,

    required this.category,
  });
}