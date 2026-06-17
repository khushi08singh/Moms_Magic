// // import 'package:flutter/material.dart';
// //
// //
// // class Dish {
// //   final String name;
// //   final String image;
// //   final int price;
// //   Dish({required this.name, required this.image, required this.price});
// // }
// //
// // class DishesPage extends StatefulWidget {
// //   const DishesPage({super.key});
// //
// //   @override
// //   State<DishesPage> createState() => _DishesPageState();
// // }
// //
// // class _DishesPageState extends State<DishesPage> {
// //   final List<Dish> _dishes = [
// //     Dish(name: 'Aloo Paratha', image: 'assets/images/dish1.jpg', price: 40),
// //     Dish(name: 'Paneer Butter Masala', image: 'assets/images/dish2.jpg', price: 120),
// //     Dish(name: 'Dal Tadka', image: 'assets/images/dish3.jpg', price: 80),
// //     Dish(name: 'Jeera Rice', image: 'assets/images/dish4.jpg', price: 50),
// //     Dish(name: 'Mix Veg', image: 'assets/images/dish5.jpg', price: 90),
// //     Dish(name: 'Gulab Jamun', image: 'assets/images/dish6.jpg', price: 30),
// //   ];
// //
// //   final List<Dish> _cart = [];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blue[200],
// //       appBar: AppBar(
// //         title: const Text("Available Dishes"),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.shopping_cart),
// //             onPressed: () {
// //               Navigator.pushNamed(context, '/cart', arguments: _cart);
// //             },
// //           )
// //         ],
// //       ),
// //       body: ListView.builder(
// //         itemCount: _dishes.length,
// //         itemBuilder: (context, index) {
// //           final dish = _dishes[index];
// //           return Card(
// //             margin: const EdgeInsets.all(8),
// //             child: ListTile(
// //               leading: Image.asset(dish.image, width: 50, fit: BoxFit.cover),
// //               title: Text(dish.name),
// //               subtitle: Text("₹${dish.price}"),
// //               trailing: ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _cart.add(dish);
// //                   });
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text("${dish.name} added to cart")),
// //                   );
// //                 },
// //                 child: const Text("Add"),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// //
// // class DishCard extends StatelessWidget {
// //   final String name;
// //   final String image;
// //   final double price;
// //
// //   const DishCard({
// //     super.key,
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(16),
// //       ),
// //
// //
// //       child: Row(
// //         mainAxisSize: MainAxisSize.min, // important for layout fix
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           ClipRRect(
// //             borderRadius: const BorderRadius.only(
// //               topLeft: Radius.circular(16),
// //               bottomLeft: Radius.circular(16),
// //             ),
// //             child: Image.asset(
// //               image,
// //               width: 100,
// //               height: 100,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           const SizedBox(width: 16),
// //           Flexible(
// //             fit: FlexFit.loose,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   name,
// //                   style: const TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 6),
// //                 Text(
// //                   "₹$price",
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.green,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 6),
// //                 ElevatedButton(
// //                   onPressed: () {},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.deepPurple,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                   child: const Text("Order Now"),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// //
// // class Dish {
// //   final String name;
// //   final String image;
// //   final int price;
// //
// //   Dish({
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //   });
// // }
// //
// // class DishesPage extends StatefulWidget {
// //   const DishesPage({super.key});
// //
// //   @override
// //   State<DishesPage> createState() => _DishesPageState();
// // }
// //
// // class _DishesPageState extends State<DishesPage> {
// //   final List<Dish> _dishes = [
// //     Dish(name: 'Aloo Paratha', image: 'assets/images/dish1.jpg', price: 40),
// //     Dish(name: 'Paneer Butter Masala', image: 'assets/images/dish2.jpg', price: 120),
// //     Dish(name: 'Dal Tadka', image: 'assets/images/dish3.jpg', price: 80),
// //     Dish(name: 'Jeera Rice', image: 'assets/images/dish4.jpg', price: 50),
// //     Dish(name: 'Mix Veg', image: 'assets/images/dish5.jpg', price: 90),
// //     Dish(name: 'Gulab Jamun', image: 'assets/images/dish6.jpg', price: 30),
// //   ];
// //
// //   final List<Dish> _cart = [];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blue[200],
// //       appBar: AppBar(
// //         title: const Text("Available Dishes"),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.shopping_cart),
// //             onPressed: () {
// //               Navigator.pushNamed(context, '/cart', arguments: _cart);
// //             },
// //           )
// //         ],
// //       ),
// //       body: ListView.builder(
// //         padding: const EdgeInsets.all(8),
// //         itemCount: _dishes.length,
// //         itemBuilder: (context, index) {
// //           final dish = _dishes[index];
// //           return DishCard(
// //             name: dish.name,
// //             image: dish.image,
// //             price: dish.price.toDouble(),
// //             onAdd: () {
// //               setState(() {
// //                 _cart.add(dish);
// //               });
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text("${dish.name} added to cart")),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class DishCard extends StatelessWidget {
// //   final String name;
// //   final String image;
// //   final double price;
// //   final VoidCallback onAdd;
// //
// //   const DishCard({
// //     super.key,
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //     required this.onAdd,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // 🖼️ Image at top
// //           ClipRRect(
// //             borderRadius: const BorderRadius.only(
// //               topLeft: Radius.circular(15),
// //               topRight: Radius.circular(15),
// //             ),
// //             child: Image.asset(
// //               image,
// //               width: 200,
// //               height: 200,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           // 📝 Texts and button
// //           Padding(
// //             padding: const EdgeInsets.all(12),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   name,
// //                   style: const TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 5),
// //                 Text(
// //                   "₹$price",
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.green,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Align(
// //                   alignment: Alignment.centerRight,
// //                   child: ElevatedButton(
// //                     onPressed: onAdd,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.amberAccent,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                     ),
// //                     child: const Text("Add to Cart"),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // import 'package:flutter/material.dart';
// //
// // class Dish {
// //   final String name;
// //   final String image;
// //   final int price;
// //
// //   Dish({
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //   });
// // }
// //
// // class DishesPage extends StatefulWidget {
// //   const DishesPage({super.key});
// //
// //   @override
// //   State<DishesPage> createState() => _DishesPageState();
// // }
// //
// // class _DishesPageState extends State<DishesPage> {
// //   final List<Dish> _dishes = [
// //     Dish(name: 'Aloo Paratha', image: 'assets/images/dish1.jpg', price: 40),
// //     Dish(name: 'Paneer Butter Masala', image: 'assets/images/dish2.jpg', price: 120),
// //     Dish(name: 'Dal Tadka', image: 'assets/images/dish3.jpg', price: 80),
// //     Dish(name: 'Jeera Rice', image: 'assets/images/dish4.jpg', price: 50),
// //     Dish(name: 'Mix Veg', image: 'assets/images/dish5.jpg', price: 90),
// //     Dish(name: 'Gulab Jamun', image: 'assets/images/dish6.jpg', price: 30),
// //   ];
// //
// //   final List<Dish> _cart = [];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blue[200],
// //       appBar: AppBar(
// //         title: const Text("Available Dishes"),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.shopping_cart),
// //             onPressed: () {
// //               Navigator.pushNamed(context, '/cart', arguments: _cart);
// //             },
// //           )
// //         ],
// //       ),
// //       body: ListView.builder(
// //         padding: const EdgeInsets.all(8),
// //         itemCount: _dishes.length,
// //         itemBuilder: (context, index) {
// //           final dish = _dishes[index];
// //           return DishCard(
// //             name: dish.name,
// //             image: dish.image,
// //             price: dish.price.toDouble(),
// //             onAdd: () {
// //               setState(() {
// //                 _cart.add(dish);
// //               });
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text("${dish.name} added to cart")),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class DishCard extends StatelessWidget {
// //   final String name;
// //   final String image;
// //   final double price;
// //   final VoidCallback onAdd;
// //
// //   const DishCard({
// //     super.key,
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //     required this.onAdd,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // 🖼️ Image at top
// //           ClipRRect(
// //             borderRadius: const BorderRadius.only(
// //               topLeft: Radius.circular(15),
// //               topRight: Radius.circular(15),
// //             ),
// //             child: Image.asset(
// //               image,
// //               width: double.infinity,
// //               height: 200,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           // 📝 Texts and button
// //           Padding(
// //             padding: const EdgeInsets.all(12),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   name,
// //                   style: const TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 5),
// //                 Text(
// //                   "₹$price",
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.green,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Align(
// //                   alignment: Alignment.centerRight,
// //                   child: ElevatedButton(
// //                     onPressed: onAdd,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.amberAccent,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                     ),
// //                     child: const Text("Add to Cart"),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../providers/cart_provider.dart';
// //
// // class Dish {
// //   final String name;
// //   final String image;
// //   final int price;
// //
// //   Dish({required this.name, required this.image, required this.price});
// // }
// //
// // class DishesPage extends StatelessWidget {
// //   const DishesPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Dish> dishes = [
// //       Dish(name: 'Aloo Paratha', image: 'assets/images/dish1.jpg', price: 40),
// //       Dish(name: 'Paneer Butter Masala', image: 'assets/images/dish2.jpg', price: 120),
// //       Dish(name: 'Dal Tadka', image: 'assets/images/dish3.jpg', price: 80),
// //       Dish(name: 'Jeera Rice', image: 'assets/images/dish4.jpg', price: 50),
// //       Dish(name: 'Mix Veg', image: 'assets/images/dish5.jpg', price: 90),
// //       Dish(name: 'Gulab Jamun', image: 'assets/images/dish6.jpg', price: 30),
// //     ];
// //
// //     final cartProvider = Provider.of<CartProvider>(context);
// //
// //     return Scaffold(
// //       backgroundColor: Colors.blue[200],
// //       appBar: AppBar(
// //         title: const Text("Available Dishes"),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.shopping_cart),
// //             onPressed: () {
// //               Navigator.pushNamed(context, '/cart');
// //             },
// //           )
// //         ],
// //       ),
// //       body: ListView.builder(
// //         padding: const EdgeInsets.all(8),
// //         itemCount: dishes.length,
// //         itemBuilder: (context, index) {
// //           final dish = dishes[index];
// //           return DishCard(
// //             name: dish.name,
// //             image: dish.image,
// //             price: dish.price.toDouble(),
// //             onAdd: () {
// //               cartProvider.addToCart(dish);
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text("${dish.name} added to cart")),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class DishCard extends StatelessWidget {
// //   final String name;
// //   final String image;
// //   final double price;
// //   final VoidCallback onAdd;
// //
// //   const DishCard({
// //     super.key,
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //     required this.onAdd,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           ClipRRect(
// //             borderRadius: const BorderRadius.only(
// //               topLeft: Radius.circular(15),
// //               topRight: Radius.circular(15),
// //             ),
// //             child: Image.asset(
// //               image,
// //               width: double.infinity,
// //               height: 200,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(12),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   name,
// //                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 5),
// //                 Text(
// //                   "₹$price",
// //                   style: const TextStyle(fontSize: 16, color: Colors.green),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Align(
// //                   alignment: Alignment.centerRight,
// //                   child: ElevatedButton(
// //                     onPressed: onAdd,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.amberAccent,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                     ),
// //                     child: const Text("Add to Cart"),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// // lib/pages/dishespage.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
//
// // 🎯 CORRECTED IMPORTS: Using the actual folder structure
// import 'package:moms_magic/models/dish.dart'; // ✅ Corrected path
// import 'package:moms_magic/widgets/dish_card.dart'; // ✅ Corrected path
//
//
// class DishesPage extends StatelessWidget {
//   const DishesPage({super.key});
//
//   // 🥘 Dishes List
//   final List<Dish> _dishes = const [
//     // ⚠️ Dish is now properly recognized as a type, so const works again!
//     Dish(name: 'Aloo Paratha', image: 'assets/images/dish1.jpg', price: 40.0,rating: 4.5, // Aap default rating de sakte hain
//       ratingCount: 150,category: 'Breakfast',),
//     Dish(name: 'Paneer Butter Masala', image: 'assets/images/dish2.jpg', price: 120.0,rating: 4.8,
//       ratingCount: 210,category: 'Main Course',),
//     Dish(name: 'Dal Tadka', image: 'assets/images/dish3.jpg', price: 80.0,rating: 4.2,
//       ratingCount: 105,category: 'Main Course',),
//     Dish(name: 'Jeera Rice', image: 'assets/images/dish4.jpg', price: 50.0,rating: 4.3,
//       ratingCount: 55,category: 'Rice',),
//     Dish(name: 'Mix Veg', image: 'assets/images/dish5.jpg', price: 90.0,rating: 4.9,
//       ratingCount: 195,category: 'Main Course',),
//     Dish(name: 'Gulab Jamun', image: 'assets/images/dish6.jpg', price: 30.0,rating: 3.9,
//       ratingCount: 90,category: 'Desserts',),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     // listen: false lagaya kyunki hum bas add to cart function call kar rahe hain
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All Dishes"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(12),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.45, // Card size
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: _dishes.length,
//         itemBuilder: (context, index) {
//           final dish = _dishes[index];
//           // DishCard is now recognized because of the correct import
//           return DishCard(
//             name: dish.name,
//             price: dish.price,
//             image: dish.image,
//
//             rating: dish.rating,
//             ratingCount: dish.ratingCount,
//
//             onAdd: () {
//               cartProvider.addToCart(dish);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("${dish.name} added to cart!")),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// lib/pages/dishespage.dart

// lib/widgets/dish_card.dart
//
// import 'package:flutter/material.dart';
//
//
// class DishCard extends StatelessWidget {
//   final String name;
//   final double price;
//   final String image;
//   final VoidCallback onAdd;
//   final double rating;
//   final int ratingCount;
//
//   const DishCard({
//     super.key,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.onAdd,
//     this.rating = 0.0,
//     this.ratingCount = 0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 🖼️ Image Section (Shrunk from flex: 5 to 4)
//           Expanded(
//             flex: 4,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 topRight: Radius.circular(16),
//               ),
//               child: Image.asset(
//                 image,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // 📝 Text and Button Section (Shrunk from flex: 3 to 2)
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(8), // Padding reduced (from 12 to 8)
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 15, // Font reduced
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 2), // Spacing reduced
//
//                   // 🌟 RATING LOGIC (All fields present) 🌟
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 12),
//                       const SizedBox(width: 3),
//                       Text(
//                         rating.toStringAsFixed(1),
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                       Text(
//                         ' (${ratingCount})',
//                         style: const TextStyle(fontSize: 11, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//
//                   Text(
//                     "₹${price.toStringAsFixed(0)}",
//                     style: const TextStyle(
//                       fontSize: 15,
//                       color: Colors.green,
//                     ),
//                   ),
//
//                   const Spacer(), // Used to push the button down
//
//                   // 🛒 Add to Cart Button (onAdd logic is here)
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: onAdd,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.amber,
//                         foregroundColor: Colors.black,
//                         padding: const EdgeInsets.symmetric(vertical: 6), // Padding reduced
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text("Add to Cart", style: TextStyle(fontSize: 12)), // Font reduced
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// //
// // ⭐ DishCard Widget
// //
// class DishCard extends StatelessWidget {
//   final String name;
//   final double price;
//   final String image;
//   final VoidCallback onAdd;
//   final double rating;
//   final int ratingCount;
//
//   const DishCard({
//     super.key,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.onAdd,
//     this.rating = 0.0,
//     this.ratingCount = 0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 🖼️ Image Section
//           Expanded(
//             flex: 4,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 topRight: Radius.circular(16),
//               ),
//               child: Image.asset(
//                 image,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           // 📝 Text + Button
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                   const SizedBox(height: 2),
//
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 12),
//                       const SizedBox(width: 3),
//                       Text(
//                         rating.toStringAsFixed(1),
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                       Text(
//                         " ($ratingCount)",
//                         style: const TextStyle(fontSize: 11, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 4),
//
//                   Text(
//                     "₹${price.toStringAsFixed(0)}",
//                     style: const TextStyle(
//                       fontSize: 15,
//                       color: Colors.green,
//                     ),
//                   ),
//
//                   const Spacer(),
//
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: onAdd,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.amber,
//                         foregroundColor: Colors.black,
//                         padding: const EdgeInsets.symmetric(vertical: 6),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text("Add to Cart", style: TextStyle(fontSize: 12)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// //
// // ⭐ NEW — DishesPage Added Here
// //
// class DishesPage extends StatelessWidget {
//   const DishesPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dishes"),
//         backgroundColor: Colors.amber,
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           children: [
//
//             // Example Dish 1
//             DishCard(
//               name: "Paneer Butter Masala",
//               price: 180,
//               image: "assets/images/paneer.jpg",
//               rating: 4.5,
//               ratingCount: 230,
//               onAdd: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Added to cart")),
//                 );
//               },
//             ),
//
//             // Example Dish 2
//             DishCard(
//               name: "Veg Biryani",
//               price: 150,
//               image: "assets/images/biryani.jpg",
//               rating: 4.3,
//               ratingCount: 180,
//               onAdd: () {},
//             ),
//
//             // Example Dish 3
//             DishCard(
//               name: "Masala Dosa",
//               price: 120,
//               image: "assets/images/dosa.jpg",
//               rating: 4.6,
//               ratingCount: 300,
//               onAdd: () {},
//             ),
//
//             // Example Dish 4
//             DishCard(
//               name: "Chole Bhature",
//               price: 130,
//               image: "assets/images/chole.jpg",
//               rating: 4.2,
//               ratingCount: 150,
//               onAdd: () {},
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
// lib/pages/dishespage.dart

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
// import 'package:moms_magic/models/dish.dart';
// import 'package:moms_magic/widgets/dish_card.dart';
//
// class DishesPage extends StatefulWidget {
//   const DishesPage({super.key});
//
//   @override
//   State<DishesPage> createState() => _DishesPageState();
// }
//
// class _DishesPageState extends State<DishesPage> {
//
//   final List<Dish> _allDishes = const [
//     Dish(name: 'Aloo Paratha', image: 'assets/images/dish1.jpg', price: 40.0, rating: 4.5, ratingCount: 150, category: 'Breakfast'),
//     Dish(name: 'Paneer Butter Masala', image: 'assets/images/dish2.jpg', price: 120.0, rating: 4.8, ratingCount: 210, category: 'Main Course'),
//     Dish(name: 'Dal Tadka', image: 'assets/images/dish3.jpg', price: 80.0, rating: 4.2, ratingCount: 105, category: 'Main Course'),
//     Dish(name: 'Jeera Rice', image: 'assets/images/dish4.jpg', price: 50.0, rating: 4.3, ratingCount: 55, category: 'Rice'),
//     Dish(name: 'Mix Veg', image: 'assets/images/dish5.jpg', price: 90.0, rating: 4.9, ratingCount: 195, category: 'Main Course'),
//     Dish(name: 'Gulab Jamun', image: 'assets/images/dish6.jpg', price: 30.0, rating: 3.9, ratingCount: 90, category: 'Desserts'),
//   ];
//
//   List<Dish> _filteredDishes = [];
//   String _searchTerm = '';
//   String? _selectedCategory;
//
//   final List<String> _categories = [
//     'All', 'Breakfast', 'Main Course', 'Rice', 'Desserts', 'Starters'
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredDishes = _allDishes;
//   }
//
//   void _filterDishes(String? category, String searchTerm) {
//     setState(() {
//       _selectedCategory = (category == 'All' || category == null) ? null : category;
//       _searchTerm = searchTerm.toLowerCase();
//
//       _filteredDishes = _allDishes.where((dish) {
//         final categoryMatch = _selectedCategory == null || dish.category == _selectedCategory;
//         final searchMatch = _searchTerm.isEmpty || dish.name.toLowerCase().contains(_searchTerm);
//
//         return categoryMatch && searchMatch;
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All Dishes"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//
//       body: Column(
//         children: [
//           // 🛑 FIX: Row to hold Search Bar and Filter Dropdown
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
//             child: Row(
//               children: [
//                 // 🔍 Search Bar UI (Expanded to take up max space)
//                 Expanded(
//                   child: TextField(
//                     onChanged: (value) {
//                       _filterDishes(_selectedCategory, value);
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Search Dishes',
//                       prefixIcon: const Icon(Icons.search),
//                       contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.grey.shade400),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(width: 8),
//
//                 // 🔽 Category Filter Dropdown (Shifted from AppBar actions)
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade400),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: DropdownButtonHideUnderline( // Hides the underline
//                     child: DropdownButton<String>(
//                       value: _selectedCategory ?? 'All',
//                       items: _categories.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value, style: const TextStyle(fontSize: 14)),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         _filterDishes(newValue, _searchTerm);
//                       },
//                       // Visual adjustments
//                       icon: const Icon(Icons.filter_list, size: 20),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // 🖼️ Dishes Grid (Expanded zaroori hai)
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(12),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.60,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemCount: _filteredDishes.length,
//               itemBuilder: (context, index) {
//                 final dish = _filteredDishes[index];
//
//                 return DishCard(
//                   name: dish.name,
//                   price: dish.price,
//                   image: dish.image,
//                   rating: dish.rating,
//                   ratingCount: dish.ratingCount,
//                   onAdd: () {
//                     cartProvider.addToCart(dish);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("${dish.name} added to cart!")),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
// import 'package:moms_magic/models/dish.dart';
// import 'package:moms_magic/widgets/dish_card.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DishesPage extends StatefulWidget {
//   const DishesPage({super.key});
//
//   @override
//   State<DishesPage> createState() => _DishesPageState();
// }
//
// class _DishesPageState extends State<DishesPage> {
//   List<Dish> _allDishes = [];
//   List<Dish> _filteredDishes = [];
//
//   bool isLoading = true;
//   String _searchTerm = '';
//   String _selectedCategory = 'All';
//
//   final List<String> _categories = [
//     'All',
//     'Breakfast',
//     'Starters',
//     'Main Course',
//     'Rice',
//     'Desserts',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchDishesFromFirestore();
//   }
//
//   // 🔥 FETCH DISHES FROM FIRESTORE
//   Future<void> fetchDishesFromFirestore() async {
//     try {
//       final snapshot =
//       await FirebaseFirestore.instance.collection('dishes').get();
//
//       final dishes = snapshot.docs.map((doc) {
//         final data = doc.data();
//         return Dish(
//           name: data['name'],
//           image: data['image'],
//           price: (data['price'] as num).toDouble(),
//           rating: (data['rating'] as num).toDouble(),
//           ratingCount: data['ratingcount'],
//           category: data['category'],
//         );
//       }).toList();
//
//       setState(() {
//         _allDishes = dishes;
//         _filteredDishes = dishes;
//         isLoading = false;
//       });
//     } catch (e) {
//       debugPrint("❌ Error fetching dishes: $e");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   // 🔍 FILTER LOGIC
//   void _filterDishes({String? category, String? search}) {
//     setState(() {
//       if (category != null) _selectedCategory = category;
//       if (search != null) _searchTerm = search.toLowerCase();
//
//       _filteredDishes = _allDishes.where((dish) {
//         final categoryMatch =
//             _selectedCategory == 'All' || dish.category == _selectedCategory;
//
//         final searchMatch = _searchTerm.isEmpty ||
//             dish.name.toLowerCase().contains(_searchTerm);
//
//         return categoryMatch && searchMatch;
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All Dishes 🍽️"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//         children: [
//           // 🔍 SEARCH + FILTER
//           Padding(
//             padding:
//             const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     onChanged: (value) {
//                       _filterDishes(search: value);
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Search dishes",
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     value: _selectedCategory,
//                     items: _categories.map((cat) {
//                       return DropdownMenuItem(
//                         value: cat,
//                         child: Text(cat),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       _filterDishes(category: value);
//                     },
//                     icon: const Icon(Icons.filter_list),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // 🍽️ DISH GRID
//           Expanded(
//             child: _filteredDishes.isEmpty
//                 ? const Center(child: Text("No dishes found 😕"))
//                 : GridView.builder(
//               padding: const EdgeInsets.all(12),
//               gridDelegate:
//               const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.42,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: _filteredDishes.length,
//               itemBuilder: (context, index) {
//                 final dish = _filteredDishes[index];
//
//                 return DishCard(
//                   name: dish.name,
//                   image: dish.image,
//                   price: dish.price,
//                   rating: dish.rating,
//                   ratingCount: dish.ratingCount,
//                   onAdd: () {
//                     cartProvider.addToCart(dish);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content:
//                         Text("${dish.name} added to cart!"),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moms_magic/providers/cart_provider.dart';
import 'package:moms_magic/models/dish.dart';
import 'package:moms_magic/widgets/dish_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dish_detail_page.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  List<Dish> _allDishes = [];
  List<Dish> _filteredDishes = [];
  bool isLoading = true;
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Breakfast',
    'Starters',
    'Main Course',
    'Rice',
    'Desserts',
  ];

  @override
  void initState() {
    super.initState();
    fetchDishes();
  }

  Future<void> fetchDishes() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('dishes').get();

    final dishes = snapshot.docs.map((doc) {
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

    setState(() {
      _allDishes = dishes;
      _filteredDishes = dishes;
      isLoading = false;
    });
  }

  void _filter(String category) {
    setState(() {
      _selectedCategory = category;
      _filteredDishes = category == 'All'
          ? _allDishes
          : _allDishes.where((d) => d.category == category).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Dishes 🍽️"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: _categories.map((cat) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: _selectedCategory == cat,
                    onSelected: (_) => _filter(cat),
                  ),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.42,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _filteredDishes.length,
              itemBuilder: (context, index) {
                final dish = _filteredDishes[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DishDetailPage(dish: dish),
                      ),
                    );
                  },
                  child: DishCard(
                    name: dish.name,
                    image: dish.image,
                    price: dish.price,
                    rating: dish.rating,
                    ratingCount: dish.ratingCount,
                    onAdd: () {
                      cartProvider.addToCart(dish);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
