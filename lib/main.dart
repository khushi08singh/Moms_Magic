
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'auth/auth_gate.dart';
import 'providers/cart_provider.dart';

import 'pages/signup_page.dart';
import 'pages/homepage.dart';
import 'pages/dishespage.dart';
import 'pages/cartpage.dart';
import 'pages/checkoutpage.dart';
import 'pages/my_orders_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),

      routes: {
        '/signup': (context) => SignupPage(),
        '/home': (context) => const HomePage(),
        '/dishes': (context) => const DishesPage(),
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => const CheckoutPage(),
        '/my-orders': (context) => const MyOrdersPage(),
      },
    );
  }
}
