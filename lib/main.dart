// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // TRY THIS: Try running your application with "flutter run". You'll see
// //         // the application has a purple toolbar. Then, without quitting the app,
// //         // try changing the seedColor in the colorScheme below to Colors.green
// //         // and then invoke "hot reload" (save your changes or press the "hot
// //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// //         // the command line to start the app).
// //         //
// //         // Notice that the counter didn't reset back to zero; the application
// //         // state is not lost during the reload. To reset the state, use hot
// //         // restart instead.
// //         //
// //         // This works for code too, not just values: Most code changes can be
// //         // tested with just a hot reload.
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //
// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.
// //
// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       // This call to setState tells the Flutter framework that something has
// //       // changed in this State, which causes it to rerun the build method below
// //       // so that the display can reflect the updated values. If we changed
// //       // _counter without calling setState(), then the build method would not be
// //       // called again, and so nothing would appear to happen.
// //       _counter++;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //       appBar: AppBar(
// //         // TRY THIS: Try changing the color here to a specific color (to
// //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// //         // change color while the other colors stay the same.
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         // Here we take the value from the MyHomePage object that was created by
// //         // the App.build method, and use it to set our appbar title.
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         // Center is a layout widget. It takes a single child and positions it
// //         // in the middle of the parent.
// //         child: Column(
// //           // Column is also a layout widget. It takes a list of children and
// //           // arranges them vertically. By default, it sizes itself to fit its
// //           // children horizontally, and tries to be as tall as its parent.
// //           //
// //           // Column has various properties to control how it sizes itself and
// //           // how it positions its children. Here we use mainAxisAlignment to
// //           // center the children vertically; the main axis here is the vertical
// //           // axis because Columns are vertical (the cross axis would be
// //           // horizontal).
// //           //
// //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// //           // action in the IDE, or press "p" in the console), to see the
// //           // wireframe for each widget.
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text('You have pushed the button this many times:'),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }
//
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MomsMagicApp());
// // }
// //
// // class MomsMagicApp extends StatelessWidget {
// //   const MomsMagicApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false, // Remove debug banner
// //       title: "Mom's Magic",
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
// //         useMaterial3: true,
// //       ),
// //       home: const HomePage(),
// //     );
// //   }
// // }
// //
// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Mom's Magic"),
// //         centerTitle: true,
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             // Logo image from assets
// //             Image.asset(
// //               "assets/images/logo.png",
// //               width: 120,
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               "Welcome to Mom's Magic 🍲",
// //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 10),
// //             const Text(
// //               "Healthy homemade food, delivered with love 💖",
// //               textAlign: TextAlign.center,
// //               style: TextStyle(fontSize: 16),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //
// //
// // import 'package:flutter/material.dart';
// // import 'pages/loginpage.dart';
// // import 'pages/homepage.dart';
// // import 'pages/dishespage.dart';
// // import 'pages/cartpage.dart';
// // import 'pages/checkoutpage.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Mom\'s Magic',
// //
// //       theme: ThemeData(primarySwatch: Colors.teal),
// //       initialRoute: '/login',
// //       routes: {
// //         '/login': (context) => const LoginPage(),
// //         '/home': (context) => const HomePage(),
// //         '/dishes': (context) => const DishesPage(),
// //         '/cart': (context) => const CartPage(),
// //         '/checkout': (context) => const CheckoutPage(),
// //       },
// //     );
// //   }
// // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:moms_magic/providers/cart_provider.dart';
// // import 'package:moms_magic/pages/homepage.dart';
// //
// // void main() {
// //   runApp(
// //     MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(create: (_) => CartProvider()),
// //       ],
// //       child: const MyApp(),
// //     ),
// //   );
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: HomePage(),
// //     );
// //   }
// // }
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:moms_magic/providers/cart_provider.dart';
// // import 'package:moms_magic/pages/homepage.dart';
// // import 'package:moms_magic/pages/dishespage.dart';
// // import 'package:moms_magic/pages/cartpage.dart';
// // import 'package:moms_magic/pages/checkoutpage.dart';
// //
// // void main() {
// //   runApp(
// //     MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(create: (_) => CartProvider()),
// //       ],
// //       child: const MyApp(),
// //     ),
// //   );
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => const HomePage(),
// //         '/dishes': (context) => const DishesPage(),
// //         '/cart': (context) => const CartPage(),
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:moms_magic/providers/cart_provider.dart';
// import 'package:moms_magic/pages/loginpage.dart';
// import 'package:moms_magic/pages/homepage.dart';
//
// import 'package:moms_magic/pages/cartpage.dart';
// import 'package:moms_magic/pages/checkoutpage.dart';
// import 'package:moms_magic/pages/dishespage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart'; // the file generated by flutterfire
// import 'package:firebase_auth/firebase_auth.dart';
// import 'pages/signup_page.dart';
// import 'auth/auth_gate.dart';
// import 'pages/my_orders_page.dart';
//


//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // 🔐 Prevent duplicate Firebase initialization
//   if (Firebase.apps.isEmpty) {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     print("✅ Firebase Initialized");
//   } else {
//     print("ℹ️ Firebase already initialized");
//   }
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(
//
//   );
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // initialRoute: '/',
//       // home: FirebaseAuth.instance.currentUser == null
//       //     ? const LoginPage()
//       //     : const HomePage(),
//
//       // home: const AuthGate(),
//       home: const RoleGate(),
//
//
//       routes: {
//         // '/': (context) => const LoginPage(),
//         '/home': (context) => const HomePage(),
//         '/dishes': (context) =>  DishesPage(),
//         '/cart': (context) => const CartPage(),
//         '/checkout': (context) => const CheckoutPage(),
//         '/signup': (context) => SignupPage(),
//         '/my-orders': (context) => const MyOrdersPage(),
//
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'pages/loginpage.dart';
// import 'pages/homepage.dart';
// import 'pages/admin_orders_page.dart';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart'; // agar hai
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const AuthGate(), // 🔥 ONLY THIS
//       routes: {
//         '/signup': (context) => const SignupPage(),
//       },
//     );
//   }
// }
//
//
//
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: const RoleGate(),
// //       routes: {
// //         '/signup': (context) => SignupPage(), // if exists
// //       },
// //     );
// //   }
// // }
//
// // class RoleGate extends StatelessWidget {
// //   const RoleGate({super.key});
// //
// //   Future<Widget> _decide() async {
// //     final user = FirebaseAuth.instance.currentUser;
// //
// //     if (user == null) {
// //       return const LoginPage();
// //     }
// //
// //     final snap = await FirebaseFirestore.instance
// //         .collection('users')
// //         .doc(user.uid)
// //         .get();
// //
// //     final role = snap.data()?['role'] ?? 'user';
// //
// //     if (role == 'admin') {
// //       return const AdminOrdersPage();
// //     } else {
// //       return const HomePage();
// //     }
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<Widget>(
// //       future: _decide(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) {
// //           return const Scaffold(
// //             body: Center(child: CircularProgressIndicator()),
// //           );
// //         }
// //         return snapshot.data!;
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       // 🔥 SINGLE ENTRY POINT (role-based)
//       home: AuthGate(),
//
//       routes: {
//         '/signup': (context) => SignupPage(),
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
// import 'pages/homepage.dart'; // 🔥 make sure this file exists
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // ✅ const constructor
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       // 🔥 SINGLE ENTRY POINT
//       home: const AuthGate(),
//
//       // 🔥 ALL ROUTES DEFINED HERE
//       routes: {
//         '/signup': (context) => const SignupPage(),
//         '/home': (context) => const HomePage(),
//       },
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
// import 'pages/dishespage.dart';
// import 'pages/cartpage.dart';
// import 'pages/my_orders_page.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: AuthGate(), // 🔥 ONLY ENTRY POINT
// //       routes: {
// //         '/signup': (context) => SignupPage(),
// //       },
// //     );
// //   }
// // }
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const AuthGate(),
//
//       routes: {
//         '/signup': (context) => const SignupPage(),
//         '/home': (context) => const HomePage(),
//         '/dishes': (context) => const DishesPage(),
//         '/cart': (context) => const CartPage(),
//         '/my-orders': (context) => const MyOrdersPage(),
//       },
//     );
//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
// import 'pages/homepage.dart';
// import 'pages/dishespage.dart';
// import 'pages/cartpage.dart';
// import 'pages/my_orders_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp( // 🔥 YE RETURN MISS THA
//       debugShowCheckedModeBanner: false,
//       home: const AuthGate(),
//
//       routes: {
//         '/signup': (context) =>  SignupPage(),
//         '/home': (context) => const HomePage(),
//         '/dishes': (context) => const DishesPage(),
//         '/cart': (context) => const CartPage(),
//         '/my-orders': (context) => const MyOrdersPage(),
//       },
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
// import 'pages/homepage.dart';
// import 'pages/dishespage.dart';
// import 'pages/cartpage.dart';
// import 'pages/my_orders_page.dart';
// import 'providers/cart_provider.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const AuthGate(),
//
//       routes: {
//         '/signup': (context) => SignupPage(),
//         '/home': (context) => const HomePage(),
//         '/dishes': (context) => const DishesPage(),
//         '/cart': (context) => const CartPage(),
//         '/my-orders': (context) => const MyOrdersPage(),
//       },
//     );
//   }
// }
//

//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
// import 'pages/homepage.dart';
// import 'pages/dishespage.dart';
// import 'pages/cartpage.dart';
// import 'pages/my_orders_page.dart';
// import 'pages/checkoutpage.dart';
// import 'providers/cart_provider.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const AuthGate(),
//
//       routes: {
//         '/signup': (context) => SignupPage(),
//         '/home': (context) => const HomePage(),
//         '/dishes': (context) => const DishesPage(),
//         '/cart': (context) => const CartPage(),
//         '/checkout': (context) => const CheckoutPage(),
//         '/my-orders': (context) => const MyOrdersPage(),
//       },
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
// import 'pages/homepage.dart';
// import 'pages/dishespage.dart';
// import 'pages/cartpage.dart';
// import 'pages/my_orders_page.dart';
// import 'pages/checkoutpage.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       // 🔐 Auth handling here
//       home: const AuthGate(),
//
//       routes: {
//         '/signup': (context) => SignupPage(),
//         '/home': (context) => const HomePage(),
//         '/dishes': (context) => const DishesPage(),
//         '/cart': (context) => const CartPage(),
//         '/checkout': (context) => const CheckoutPage(),
//         '/my-orders': (context) => const MyOrdersPage(),
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'auth/auth_gate.dart';
// import 'pages/signup_page.dart';
// import 'pages/homepage.dart';
// import 'pages/dishespage.dart';
// import 'pages/cartpage.dart';
// import 'pages/checkoutpage.dart';
// import 'pages/my_orders_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const AuthGate(),
//
//       routes: {
//         '/signup': (context) => SignupPage(),
//         '/home': (context) => const HomePage(),
//         '/dishes': (context) => const DishesPage(),
//         '/cart': (context) => const CartPage(),
//         '/checkout': (context) => const CheckoutPage(),
//         '/my-orders': (context) => const MyOrdersPage(),
//       },
//     );
//   }
// }

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
