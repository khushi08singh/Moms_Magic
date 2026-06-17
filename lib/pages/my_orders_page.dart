import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case 'accepted':
        return Colors.blue;
      case 'preparing':
        return Colors.orange;
      case 'out_for_delivery':
        return Colors.purple;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey; // pending
    }
  }

  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('userId', isEqualTo: userId)
            .snapshots(),
        builder: (context, snapshot) {
          // 🔄 Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ No orders
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No orders found"));
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final List items = order['items'] as List;
              final String status = order['status'] ?? 'pending';

              final data = order.data() as Map<String, dynamic>;



              return Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "Order ID: ${order.id}",
                      //   style: const TextStyle(fontWeight: FontWeight.bold),
                      // ),

                      Text(
                        "Order #${order.id.substring(0, 8)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      ...items.map((item) {
                        return Text(
                          "${item['name']} × ${item['quantity']}  — ₹${item['price']}",
                        );
                      }).toList(),

                      const Divider(),
                      const SizedBox(height: 8),

                      // 👤 USER DETAILS


              Text("Name: ${data['name'] ?? 'Not provided'}"),
              Text("Phone: ${data['phone'] ?? 'Not provided'}"),
              Text("Address: ${data['address'] ?? 'Not provided'}"),
              Text("Payment: ${data['paymentMethod'] ?? 'Not specified'}"),


              const SizedBox(height: 8),

                      // 🔥 STATUS ROW
                      // Row(
                      //   children: [
                      //     const Text(
                      //       "Status: ",
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //     Text(
                      //       status.toUpperCase(),
                      //       style: TextStyle(
                      //         color: getStatusColor(status),
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          const Text(
                            "Status: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: getStatusColor(status).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              status.toUpperCase(),
                              style: TextStyle(
                                color: getStatusColor(status),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Text(
                      //   "Total: ₹${order['totalAmount']}",
                      //   style: const TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      Text(
                        "Total: ₹${order['totalAmount']}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
