// import 'package:flutter/material.dart';
// import '../models/dish.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final List<Dish> _dishes = [
//     Dish(name: 'Aloo Paratha', image: 'assets/images/dish1.jpg', price: 40),
//     Dish(name: 'Paneer Butter Masala', image: 'assets/images/dish2.jpg', price: 120),
//     Dish(name: 'Dal Tadka', image: 'assets/images/dish3.jpg', price: 80),
//     Dish(name: 'Jeera Rice', image: 'assets/images/dish4.jpg', price: 50),
//     Dish(name: 'Mix Veg', image: 'assets/images/dish5.jpg', price: 90),
//     Dish(name: 'Gulab Jamun', image: 'assets/images/dish6.jpg', price: 30),
//   ];
//
//   String _query = '';
//
//   @override
//   Widget build(BuildContext context) {
//     final filtered = _dishes.where((d) => d.name.toLowerCase().contains(_query.toLowerCase())).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mom's Magic"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cart is empty')));
//             },
//           )
//         ],
//       ),
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                 currentAccountPicture: CircleAvatar(child: Image.asset('assets/images/logo.png', errorBuilder: (_,__,___)=>const FlutterLogo())),
//                 accountName: const Text('Student Demo'),
//                 accountEmail: const Text('demo@mom.com'),
//               ),
//               ListTile(leading: const Icon(Icons.home), title: const Text('Home'), onTap: () => Navigator.pop(context)),
//               ListTile(leading: const Icon(Icons.person), title: const Text('Profile'), onTap: () => Navigator.pop(context)),
//               const Spacer(),
//               ListTile(
//                 leading: const Icon(Icons.logout),
//                 title: const Text('Logout'),
//                 onTap: () => Navigator.pushReplacementNamed(context, '/login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             _searchBar(),
//             const SizedBox(height: 12),
//             _categories(),
//             const SizedBox(height: 12),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: filtered.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
//                   childAspectRatio: 0.78,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemBuilder: (context, index) {
//                   final d = filtered[index];
//                   return _DishCard(dish: d, onAdd: () {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${d.name} added to cart')));
//                   });
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _searchBar() {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: 'Search dishes, e.g., paratha',
//         prefixIcon: const Icon(Icons.search),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//         contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
//       ),
//       onChanged: (v) => setState(() => _query = v),
//     );
//   }
//
//   Widget _categories() {
//     final cats = ['All', 'North', 'South', 'Sweets', 'Rice', 'Veg'];
//     return SizedBox(
//       height: 40,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: cats.length,
//         separatorBuilder: (_, __) => const SizedBox(width: 8),
//         itemBuilder: (context, i) {
//           return ChoiceChip(label: Text(cats[i]), selected: false, onSelected: (_) {});
//         },
//       ),
//     );
//   }
// }
//
// class _DishCard extends StatelessWidget {
//   final Dish dish;
//   final VoidCallback onAdd;
//   const _DishCard({Key? key, required this.dish, required this.onAdd}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//               child: _imageWidget(dish.image),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(dish.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 4),
//                 Text('₹${dish.price.toStringAsFixed(0)}', style: TextStyle(color: Colors.grey[700])),
//                 const SizedBox(height: 6),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(onPressed: onAdd, child: const Text('Add')),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _imageWidget(String path) {
//     if (path.startsWith('http')) {
//       return Image.network(path, fit: BoxFit.cover);
//     } else {
//       return Image.asset(path, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: Colors.grey[200], child: const Center(child: Icon(Icons.fastfood))));
//     }
//   }
// }


//
// import 'package:flutter/material.dart';
// // import 'dishespage.dart';
// import 'package:moms_magic/pages/dishespage.dart';
//
//
//
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   backgroundColor:  Colors.pink[200],
//     //   appBar: AppBar(title: const Text("Mom's Magic")),
//     //   body: Center(
//     //     child: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: [
//     //         Image.asset("assets/images/logo.png", height: 100),
//     //         const SizedBox(height: 20),
//     //         const Text("Delicious Homemade Food",
//     //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//     //         const SizedBox(height: 20),
//     //         ElevatedButton(
//     //           onPressed: () {
//     //             Navigator.pushNamed(context, '/dishes');
//     //           },
//     //           child: const Text("Explore Dishes"),
//     //
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "Mom’s Magic 🍲",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//             onPressed: () {
//               // yahan tum baad me cart page open karogi
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Welcome to Mom’s Magic 👩‍🍳",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Healthy homemade meals, made with love ❤️",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 20),
//
//               SizedBox(height: 20),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Featured Dishes 🍛',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//               // SingleChildScrollView(
//               //   scrollDirection: Axis.horizontal,
//               //
//               //   child: Row(
//               //     children: [
//               //       DishCard(
//               //         name: 'Rajma Chawal',
//               //         image: 'assets/images/rajma_chawal.jpg',
//               //         price: 120,
//               //         onAdd: () {},
//               //       ),
//               //       DishCard(
//               //         name: 'Paneer Tikka',
//               //         image: 'assets/images/paneer_tikka.jpg',                      price: 150,
//               //         onAdd: () {},
//               //       ),
//               //       DishCard(
//               //         name: 'Poha',
//               //         image: 'assets/images/poha.jpg',
//               //         price: 80,
//               //         onAdd: () {},
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // 📝 This block is inside the 'body' of your HomePage widget
//
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0), // Added padding for spacing
//
//                 child: Row(
//                   children: [
//                     // 🎯 CORRECTED WIDGET NAME
//                     _FeaturedDishCard(
//                       name: 'Rajma Chawal',
//                       image: 'assets/images/rajma_chawal.jpg',
//                       price: 120.0, // Use double
//                       onAdd: () {
//                         // Add your cart logic here (using provider)
//                       },
//                     ),
//                     _FeaturedDishCard(
//                       name: 'Paneer Tikka',
//                       image: 'assets/images/paneer_tikka.jpg',
//                       price: 150.0, // Use double
//                       onAdd: () {
//                         // Add your cart logic here
//                       },
//                     ),
//                     _FeaturedDishCard(
//                       name: 'Poha',
//                       image: 'assets/images/poha.jpg',
//                       price: 80.0, // Use double
//                       onAdd: () {
//                         // Add your cart logic here
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//
//
//               // yahan tumhari dishes ya cards aayenge (next step me improve karenge)
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
// }
// // 👈 Yeh code aapko 'lib/pages/homepage.dart' file ke END mein paste karna hai.
//
// class _FeaturedDishCard extends StatelessWidget {
//   final String name;
//   final String image;
//   final double price;
//   final VoidCallback onAdd;
//
//   const _FeaturedDishCard({
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.onAdd,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         width: 150, // Fixed width for horizontal scroll
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 image,
//                 height: 80,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               name,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//             Text(
//               "₹${price.toStringAsFixed(0)}",
//               style: const TextStyle(color: Colors.green, fontSize: 13),
//             ),
//             const SizedBox(height: 8),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: onAdd,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(4),
//                   backgroundColor: Colors.orange,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: const Text("Add", style: TextStyle(fontSize: 12)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// // lib/pages/homepage.dart
//
// import 'package:flutter/material.dart';
// // 👈 FIX 1: Missing Imports Added
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
// import 'package:moms_magic/models/dish.dart';
//
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   // 👈 FIX 2: Featured Dishes Data Added
//   final List<Dish> _featuredDishes = const [
//     Dish(name: 'Rajma Chawal', image: 'assets/images/rajma_chawal.jpg', price: 120.0),
//     Dish(name: 'Paneer Tikka', image: 'assets/images/paneer_tikka.jpg', price: 150.0),
//     Dish(name: 'Poha', image: 'assets/images/poha.jpg', price: 80.0),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     // 👈 FIX 3: Provider Access
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "Mom’s Magic 🍲",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//             onPressed: () {
//               // 👈 FIX 4: Cart Icon Navigation
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//
//       // 🧭 FIX 5: Navigation Drawer Added (For Explore Dishes/Logout)
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.pinkAccent),
//               child: Text('Mom\'s Magic Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () { Navigator.pop(context); },
//             ),
//             ListTile(
//               leading: const Icon(Icons.restaurant_menu),
//               title: const Text('Explore Dishes'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/dishes'); // Go to All Dishes
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.shopping_cart),
//               title: const Text('View Cart'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/cart'); // Go to Cart Page
//               },
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/');
//               },
//             ),
//           ],
//         ),
//       ),
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ... Welcome Text ...
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Welcome to Mom’s Magic 👩‍🍳",
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Healthy homemade meals, made with love ❤️",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(
//                   'Featured Dishes 🍛',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               // 🖼️ Corrected Featured Dishes List
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//
//                 child: Row(
//                   children: _featuredDishes.map((dish) {
//                     return _FeaturedDishCard(
//                       name: dish.name,
//                       image: dish.image,
//                       price: dish.price,
//                       onAdd: () {
//                         // 👈 FIX 6: Add to Cart Logic
//                         cartProvider.addToCart(dish);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("${dish.name} added to cart!"), duration: const Duration(seconds: 1)),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // 👈 Link to All Dishes (Where 6 dishes are visible)
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/dishes');
//                     },
//                     icon: const Icon(Icons.restaurant_menu),
//                     label: const Text("View All Dishes"),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                       backgroundColor: Colors.pink,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // 👈 FIX 7: _FeaturedDishCard Class (Added at the end of the file)
// class _FeaturedDishCard extends StatelessWidget {
//   final String name;
//   final String image;
//   final double price;
//   final VoidCallback onAdd;
//
//   const _FeaturedDishCard({
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.onAdd,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         width: 150,
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 image,
//                 height: 80,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               name,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//             Text(
//               "₹${price.toStringAsFixed(0)}",
//               style: const TextStyle(color: Colors.green, fontSize: 13),
//             ),
//             const SizedBox(height: 8),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: onAdd,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(4),
//                   backgroundColor: Colors.orange,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: const Text("Add", style: TextStyle(fontSize: 12)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/pages/homepage.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
// import 'package:moms_magic/models/dish.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
//  class HomePage extends StatelessWidget {
//
//
//   const HomePage({super.key});
//
//   // Featured Dishes Data
//   final List<Dish> _featuredDishes = const [
//     Dish(name: 'Rajma Chawal', image: 'assets/images/rajma_chawal.jpg', price: 120.0,rating: 4.7,
//       ratingCount: 180,category: 'Main Course',),
//     Dish(name: 'Paneer Tikka', image: 'assets/images/paneer_tikka.jpg', price: 150.0,rating: 4.9,
//       ratingCount: 100,category: 'Starters',),
//     Dish(name: 'Poha', image: 'assets/images/poha.jpg', price: 80.0,rating: 5.0,
//       ratingCount: 90,category: 'Breakfast',),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "Mom’s Magic 🍲",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//
//       // 🧭 Navigation Drawer
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.pinkAccent),
//               child: Text('Mom\'s Magic Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () { Navigator.pop(context); },
//             ),
//             ListTile(
//               leading: const Icon(Icons.restaurant_menu),
//               title: const Text('Explore Dishes'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/dishes');
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.shopping_cart),
//               title: const Text('View Cart'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/cart');
//               },
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/');
//               },
//             ),
//           ],
//         ),
//       ),
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Welcome Text
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Welcome to Mom’s Magic 👩‍🍳",
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Healthy homemade meals, made with love ❤️",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(
//                   'Featured Dishes 🍛',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               // 🖼️ VERTICAL GRID IMPLEMENTATION (The Change)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: GridView.builder(
//                   // 👈 Makes the grid fit inside the SingleChildScrollView
//                   shrinkWrap: true,
//                   // 👈 Disables scrolling for the grid itself
//                   physics: const NeverScrollableScrollPhysics(),
//
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, // Two items per row
//                     childAspectRatio: 0.8, // Adjust ratio for better vertical spacing
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8,
//                   ),
//
//                   itemCount: _featuredDishes.length,
//                   itemBuilder: (context, index) {
//                     final dish = _featuredDishes[index];
//
//                     return _FeaturedDishCard(
//                       name: dish.name,
//                       image: dish.image,
//                       price: dish.price,
//
//                       rating: dish.rating,
//                       ratingCount: dish.ratingCount,
//
//                       onAdd: () {
//                         cartProvider.addToCart(dish);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("${dish.name} added to cart!"), duration: const Duration(seconds: 1)),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               // End of Featured Dishes Section
//
//               const SizedBox(height: 20),
//
//               // Link to All Dishes
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/dishes');
//                     },
//                     icon: const Icon(Icons.restaurant_menu),
//                     label: const Text("View All Dishes"),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                       backgroundColor: Colors.pink,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // _FeaturedDishCard Class Definition (Unchanged)
// class _FeaturedDishCard extends StatelessWidget {
//   final String name;
//   final String image;
//   final double price;
//   final VoidCallback onAdd;
//
//   final double rating;
//   final int ratingCount;
//   const _FeaturedDishCard({
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.onAdd,
//     this.rating = 0.0,
//     this.ratingCount = 0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Removed margin here since GridView adds spacing
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         // width removed since GridView manages width
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 image,
//                 height: 80,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               name,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//
//             // 🌟 2. UI DISPLAY: Rating Row Added Here 🌟
//             Row(
//               children: [
//                 const Icon(Icons.star, color: Colors.amber, size: 14),
//                 const SizedBox(width: 4),
//                 Text(
//                   // Display the rating (e.g., 4.7)
//                   rating.toStringAsFixed(1),
//                   style: const TextStyle(fontSize: 12),
//                 ),
//                 Text(
//                   // Display the rating count (e.g., (180))
//                   ' (${ratingCount})',
//                   style: const TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             ),
//             // -
//             const SizedBox(height: 4),
//             Text(
//               "₹${price.toStringAsFixed(0)}",
//               style: const TextStyle(color: Colors.green, fontSize: 13),
//             ),
//             const SizedBox(height: 8),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: onAdd,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(4),
//                   backgroundColor: Colors.orange,
//                   foregroundColor: Colors.white,
//                 ),
//                 child: const Text("Add", style: TextStyle(fontSize: 12)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
// import 'package:moms_magic/models/dish.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String userEmail = "";
//   List<Dish> dishes = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//     fetchDishes();
//   }
//
//   // 🔹 USER EMAIL
//   void fetchUserData() {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         userEmail = user.email ?? "";
//       });
//     }
//   }
//
//   // 🔹 FETCH DISHES FROM FIRESTORE
//   Future<void> fetchDishes() async {
//     try {
//       final snapshot =
//       // await FirebaseFirestore.instance.collection('dishes').get();
//       await FirebaseFirestore.instance
//           .collection('dishes')
//           .where('featured', isEqualTo: true)
//           .limit(4)
//           .get();
//
//
//       final loadedDishes = snapshot.docs.map((doc) {
//         final data = doc.data();
//         return Dish(
//           name: data['name'],
//           price: (data['price'] as num).toDouble(),
//           image: data['image'],
//           rating: (data['rating'] as num).toDouble(),
//           ratingCount: data['ratingcount'],
//           category: data['category'],
//         );
//       }).toList();
//
//       setState(() {
//         dishes = loadedDishes;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("❌ Error loading dishes: $e");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "Mom’s Magic 🍲",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//
//       // 🔹 DRAWER
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.pink),
//               child: Text(
//                 "Mom's Magic Menu",
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//
//             // 🏠 HOME
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text("Home"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//
//             // 🍽 ALL DISHES
//             ListTile(
//               leading: const Icon(Icons.restaurant_menu),
//               title: const Text("All Dishes"),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/dishes');
//               },
//             ),
//             // 📦 MY ORDERS
//             ListTile(
//               leading: const Icon(Icons.receipt_long),
//               title: const Text("My Orders"),
//               onTap: () {
//                 Navigator.pop(context); // drawer close
//                 Navigator.pushNamed(context, '/my-orders');
//               },
//             ),
//
//
//             // 🛒 CART
//             ListTile(
//               leading: const Icon(Icons.shopping_cart),
//               title: const Text("Cart"),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/cart');
//               },
//             ),
//
//             const Divider(),
//
//             // 🚪 LOGOUT
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text("Logout"),
//               onTap: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.pushReplacementNamed(context, '/');
//               },
//             ),
//           ],
//         ),
//       ),
//
//
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 👋 WELCOME
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Welcome 👋",
//                     style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     userEmail,
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 "Featured Dishes 🍽️",
//                 style:
//                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.72,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                 ),
//                 itemCount: dishes.length,
//                 itemBuilder: (context, index) {
//                   final dish = dishes[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                     elevation: 4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset(
//                               dish.image,
//                               height: 130,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Text(
//                             dish.name,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           Row(
//                             children: [
//                               const Icon(Icons.star,
//                                   size: 14, color: Colors.amber),
//                               Text(
//                                 " ${dish.rating}",
//                                 style:
//                                 const TextStyle(fontSize: 12),
//                               ),
//                               Text(
//                                 " (${dish.ratingCount})",
//                                 style: const TextStyle(
//                                     fontSize: 12, color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             "₹${dish.price.toStringAsFixed(0)}",
//                             style: const TextStyle(
//                                 color: Colors.green),
//                           ),
//                           const Spacer(),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.orange,
//                                 foregroundColor: Colors.white,
//                               ),
//                               onPressed: () {
//                                 cartProvider.addToCart(dish);
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(
//                                   SnackBar(
//                                       content: Text(
//                                           "${dish.name} added")),
//                                 );
//                               },
//                               child: const Text("Add"),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/dishes');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pink,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 30, vertical: 15),
//                 ),
//                 child: const Text("View All Dishes"),
//               ),
//             ),
//
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
// import 'package:moms_magic/models/dish.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dish_detail_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String userEmail = "";
//   List<Dish> dishes = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//     fetchDishes();
//   }
//
//   void fetchUserData() {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         userEmail = user.email ?? "";
//       });
//     }
//   }
//
//   Future<void> fetchDishes() async {
//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('dishes')
//           .where('featured', isEqualTo: true)
//           .limit(4)
//           .get();
//
//       final loadedDishes = snapshot.docs.map((doc) {
//         final data = doc.data();
//         return Dish(
//           name: data['name'],
//           price: (data['price'] as num).toDouble(),
//           image: data['image'],
//           rating: (data['rating'] as num).toDouble(),
//           ratingCount: data['ratingcount'],
//           category: data['category'],
//         );
//       }).toList();
//
//       setState(() {
//         dishes = loadedDishes;
//         isLoading = false;
//       });
//     } catch (e) {
//       isLoading = false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "Mom’s Magic 🍲",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Welcome 👋",
//                     style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     userEmail,
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 "Featured Dishes 🍽️",
//                 style:
//                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.72,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                 ),
//                 itemCount: dishes.length,
//                 itemBuilder: (context, index) {
//                   final dish = dishes[index];
//
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               DishDetailPage(dish: dish),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                       elevation: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                 dish.image,
//                                 height: 130,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             Text(
//                               dish.name,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Row(
//                               children: [
//                                 const Icon(Icons.star,
//                                     size: 14, color: Colors.amber),
//                                 Text(" ${dish.rating}"),
//                                 Text(
//                                   " (${dish.ratingCount})",
//                                   style: const TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               "₹${dish.price.toStringAsFixed(0)}",
//                               style: const TextStyle(color: Colors.green),
//                             ),
//                             const Spacer(),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.orange,
//                                 ),
//                                 onPressed: () {
//                                   cartProvider.addToCart(dish);
//                                 },
//                                 child: const Text("Add"),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/dishes');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pink,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 30, vertical: 15),
//                 ),
//                 child: const Text("View All Dishes"),
//               ),
//             ),
//
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moms_magic/providers/cart_provider.dart';
import 'package:moms_magic/models/dish.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dish_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userEmail = "";
  List<Dish> dishes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchDishes();
  }

  void fetchUserData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ?? "";
      });
    }
  }

  Future<void> fetchDishes() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('dishes')
          .where('featured', isEqualTo: true)
          .limit(4)
          .get();

      final loadedDishes = snapshot.docs.map((doc) {
        final data = doc.data();
        return Dish(
          name: data['name'],
          price: (data['price'] as num).toDouble(),
          image: data['image'],
          rating: (data['rating'] as num).toDouble(),
          ratingCount: data['ratingcount'],
          category: data['category'],
        );
      }).toList();

      setState(() {
        dishes = loadedDishes;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ✅ DRAWER (THIS WAS MISSING)
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.pink),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Mom's Magic Menu",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text("All Dishes"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/dishes');
              },
            ),

            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("My Orders"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/my-orders');
              },
            ),

            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Cart"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
              },
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),

      // ✅ APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Mom’s Magic 🍲",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),

      // ✅ BODY
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome 👋",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userEmail,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Featured Dishes 🍽️",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: dishes.length,
                itemBuilder: (context, index) {
                  final dish = dishes[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DishDetailPage(dish: dish),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                dish.image,
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              dish.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 14, color: Colors.amber),
                                Text(" ${dish.rating}"),
                                Text(
                                  " (${dish.ratingCount})",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(
                              "₹${dish.price.toStringAsFixed(0)}",
                              style: const TextStyle(color: Colors.green),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                // onPressed: () {
                                //   cartProvider.addToCart(dish);
                                // },
                                onPressed: () {
                                  cartProvider.addToCart(dish);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${dish.name} added to cart 🛒"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },

                                child: const Text("Add"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dishes');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                ),
                child: const Text("View All Dishes"),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
