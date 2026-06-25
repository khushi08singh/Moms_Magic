import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  final String name;
  final double price; // Changed to double for consistency
  final String image;
  final VoidCallback onAdd; // 👈 Nayi property

  final double rating;
  final int ratingCount;

  const DishCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onAdd, // 👈 Required kiya

    this.rating = 0.0,
    this.ratingCount = 0,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(16),
          //     topRight: Radius.circular(16),
          //   ),
          //   child: Image.asset(
          //     image,
          //     width: double.infinity,
          //     height: 180,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "₹${price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),

                // 🌟 RATING DISPLAY ADDED HERE 🌟
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1), // Rating value
                      style: const TextStyle(fontSize: 13),
                    ),
                    Text(
                      ' (${ratingCount})', // Rating count
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 6), // Price se pehle space
// ------------------------------------

                // 🛒 Button updated to use onAdd callback
                ElevatedButton(
                  onPressed: onAdd, // 👈 onPressed function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("+ Add"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}