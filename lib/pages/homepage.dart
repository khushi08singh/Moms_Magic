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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.black12,
          ),
        ),
      ),

      // ✅ BODY
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         "Welcome 👋",
            //         style: TextStyle(
            //             fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //       Text(
            //         userEmail,
            //         style: const TextStyle(color: Colors.grey),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.pink.shade100,
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back 👋",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            userEmail,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     "Featured Dishes 🍽️",
            //     style:
            //     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Featured Dishes 🍽️",
            //         style: TextStyle(
            //           fontSize: 22,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Text(
            //          "Top Picks",
            //
            //         style: TextStyle(
            //           color: Colors.pink,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Dishes 🍽️",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Top Picks",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
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
                    // child: Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15)),
                    //   elevation: 4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      elevation: 6,
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
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.pink,
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 30, vertical: 15),
                // ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: const Size(220, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),

                // child: const Text("View All Dishes"),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "View All Dishes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
