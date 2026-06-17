// // import 'package:flutter/material.dart';
// // import 'dishespage.dart';
// //
// // class CartPage extends StatelessWidget {
// //   const CartPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Dish> cart = ModalRoute.of(context)!.settings.arguments as List<Dish>? ?? [];
// //
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Your Cart")),
// //       body: cart.isEmpty
// //           ? const Center(child: Text("Cart is empty"))
// //           : Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: cart.length,
// //               itemBuilder: (context, index) {
// //                 final dish = cart[index];
// //                 return ListTile(
// //                   leading: Image.asset(dish.image, width: 50, fit: BoxFit.cover),
// //                   title: Text(dish.name),
// //                   subtitle: Text("₹${dish.price}"),
// //                 );
// //               },
// //             ),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.pushNamed(context, '/checkout');
// //             },
// //             child: const Text("Proceed to Checkout"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
// import 'dishespage.dart';
//
// class CartPage extends StatelessWidget {
//   const CartPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final cart = cartProvider.items;
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Your Cart")),
//       body: cart.isEmpty
//           ? const Center(child: Text("Cart is empty"))
//           : Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.length,
//               itemBuilder: (context, index) {
//                 final dish = cart[index];
//                 return ListTile(
//                   leading: Image.asset(dish.image, width: 50, fit: BoxFit.cover),
//                   title: Text(dish.name),
//                   subtitle: Text("₹${dish.price}"),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () {
//                       cartProvider.removeFromCart(dish);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/checkout');
//               },
//               child: const Text("Proceed to Checkout"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: cart.items.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Text("₹${item.price}"),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Total: ₹${cart.totalPrice.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: const Text("Proceed to Checkout"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
