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
