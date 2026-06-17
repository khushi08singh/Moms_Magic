// import 'package:flutter/material.dart';
//
// class CheckoutPage extends StatelessWidget {
//   const CheckoutPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Order Confirmation")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.check_circle, color: Colors.green, size: 80),
//             const SizedBox(height: 20),
//             const Text("Your order has been placed!",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
//               },
//               child: const Text("Back to Home"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:moms_magic/pages/checkoutpage.dart';
//
// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({super.key});
//
//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }
//
// class _CheckoutPageState extends State<CheckoutPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//
//   String paymentMethod = 'COD';
//   bool isPlacingOrder = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = context.read<CartProvider>();
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Checkout")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Delivery Details",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//
//             const SizedBox(height: 12),
//
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: "Full Name",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             TextField(
//               controller: phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: const InputDecoration(
//                 labelText: "Phone Number",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             TextField(
//               controller: addressController,
//               maxLines: 3,
//               decoration: const InputDecoration(
//                 labelText: "Delivery Address",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             DropdownButtonFormField<String>(
//               value: paymentMethod,
//               decoration: const InputDecoration(
//                 labelText: "Payment Method",
//                 border: OutlineInputBorder(),
//               ),
//               items: const [
//                 DropdownMenuItem(
//                   value: 'COD',
//                   child: Text("Cash on Delivery"),
//                 ),
//               ],
//               onChanged: (value) {
//                 setState(() {
//                   paymentMethod = value!;
//                 });
//               },
//             ),
//
//             const SizedBox(height: 20),
//
//             Text(
//               "Total Amount: ₹${cartProvider.totalPrice.toStringAsFixed(0)}",
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 onPressed: isPlacingOrder
//                     ? null
//                     : () async {
//                   if (nameController.text.isEmpty ||
//                       phoneController.text.isEmpty ||
//                       addressController.text.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Please fill all details"),
//                       ),
//                     );
//                     return;
//                   }
//
//                   setState(() {
//                     isPlacingOrder = true;
//                   });
//
//                   final user = FirebaseAuth.instance.currentUser;
//                   if (user == null) return;
//
//                   try {
//                     await FirebaseFirestore.instance
//                         .collection('orders')
//                         .add({
//                       'userId': user.uid,
//                       'name': nameController.text,
//                       'phone': phoneController.text,
//                       'address': addressController.text,
//                       'paymentMethod': paymentMethod,
//                       'items': cartProvider.items
//                           .map((item) => {
//                         'name': item.name,
//                         'price': item.price,
//                         'quantity': 1,
//                       })
//                           .toList(),
//                       'totalAmount': cartProvider.totalPrice,
//                       'status': 'pending',
//                       'createdAt': FieldValue.serverTimestamp(),
//                     });
//
//                     cartProvider.clearCart();
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content:
//                         Text("Order placed successfully 🎉"),
//                       ),
//                     );
//
//                     Navigator.pop(context);
//                   } catch (e) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Order failed: $e")),
//                     );
//                   } finally {
//                     setState(() {
//                       isPlacingOrder = false;
//                     });
//                   }
//                 },
//                 child: isPlacingOrder
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text("Place Order"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String paymentMethod = 'COD';
  bool isPlacingOrder = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Delivery Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Delivery Address",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: paymentMethod,
              decoration: const InputDecoration(
                labelText: "Payment Method",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'COD',
                  child: Text("Cash on Delivery"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              "Total Amount: ₹${cartProvider.totalPrice.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: isPlacingOrder
                    ? null
                    : () async {
                  if (nameController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      addressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all details"),
                      ),
                    );
                    return;
                  }

                  setState(() => isPlacingOrder = true);

                  final user =
                      FirebaseAuth.instance.currentUser;
                  if (user == null) return;

                  try {
                    await FirebaseFirestore.instance
                        .collection('orders')
                        .add({
                      'userId': user.uid,
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'address': addressController.text,
                      'paymentMethod': paymentMethod,
                      'items': cartProvider.items
                          .map((item) => {
                        'name': item.name,
                        'price': item.price,
                        'quantity': 1,
                      })
                          .toList(),
                      'totalAmount':
                      cartProvider.totalPrice,
                      'status': 'pending',
                      'createdAt':
                      FieldValue.serverTimestamp(),
                    });

                    cartProvider.clearCart();

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content:
                        Text("Order placed successfully 🎉"),
                      ),
                    );

                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Order failed: $e"),
                      ),
                    );
                  } finally {
                    setState(() => isPlacingOrder = false);
                  }
                },
                child: isPlacingOrder
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
