// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../pages/loginPage.dart';
// import '../pages/homepage.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         // Loading state
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         // User logged in
//         if (snapshot.hasData) {
//           return const HomePage();
//         }
//
//         // User logged out
//         return const LoginPage();
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/cart_provider.dart';
// import '../pages/loginpage.dart';
// import '../pages/homepage.dart';
// import '../pages/admin_orders_page.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   // 👇 YAHAN LIKHNA HAI
//   Future<Widget> _decide() async {
//     final user = FirebaseAuth.instance.currentUser;
//
//     if (user == null) {
//       return const LoginPage();
//     }
//
//     final snap = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .get();
//
//     final role = snap.data()?['role'] ?? 'user';
//
//     if (role == 'admin') {
//       return const AdminOrdersPage();
//     } else {
//       return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => CartProvider()),
//         ],
//         child: const HomePage(),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//       future: _decide(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//         return snapshot.data!;
//       },
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/cart_provider.dart';
// import '../pages/loginpage.dart';
// import '../pages/homepage.dart';
// import '../pages/admin_orders_page.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   Future<Widget> _decide() async {
//     final user = FirebaseAuth.instance.currentUser;
//
//     if (user == null) {
//       return const LoginPage();
//     }
//
//     final snap = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .get();
//
//     final role = snap.data()?['role'] ?? 'user';
//
//     if (role == 'admin') {
//       return const AdminOrdersPage();
//     } else {
//       return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => CartProvider()),
//         ],
//         child: const HomePage(),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//       future: _decide(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//         return snapshot.data!;
//       },
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/cart_provider.dart';
// import '../pages/loginpage.dart';
// import '../pages/homepage.dart';
// import '../pages/admin_orders_page.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, authSnapshot) {
//         // ⏳ Firebase auth loading
//         if (authSnapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         // ❌ User not logged in
//         if (!authSnapshot.hasData) {
//           return const LoginPage();
//         }
//
//         final user = authSnapshot.data!;
//
//         // 🔐 User logged in → check role from Firestore
//         return FutureBuilder<DocumentSnapshot>(
//           future: FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .get(),
//           builder: (context, roleSnapshot) {
//             if (roleSnapshot.connectionState == ConnectionState.waiting) {
//               return const Scaffold(
//                 body: Center(child: CircularProgressIndicator()),
//               );
//             }
//
//             // 🔒 SAFE DATA READ (NO CRASH)
//             final data =
//             roleSnapshot.data?.data() as Map<String, dynamic>?;
//
//             final role = data?['role'] ?? 'user';
//
//             // 🛡️ Admin
//             if (role == 'admin') {
//               return const AdminOrdersPage();
//             }
//
//             // 🛒 Normal user with CartProvider
//             return ChangeNotifierProvider(
//               create: (_) => CartProvider(),
//               child: const HomePage(),
//             );
//           },
//         );
//       },
//     );
//   }
// // }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/cart_provider.dart';
// import '../pages/loginpage.dart';
// import '../pages/homepage.dart';
// import '../pages/admin_orders_page.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, authSnapshot) {
//         if (authSnapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         // ❌ Not logged in
//         if (!authSnapshot.hasData) {
//           return const LoginPage();
//         }
//
//         final user = authSnapshot.data!;
//
//         // 🔍 Fetch role from Firestore
//         return FutureBuilder<DocumentSnapshot>(
//           future: FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .get(),
//           builder: (context, roleSnapshot) {
//             if (roleSnapshot.connectionState == ConnectionState.waiting) {
//               return const Scaffold(
//                 body: Center(child: CircularProgressIndicator()),
//               );
//             }
//
//             final data =
//             roleSnapshot.data?.data() as Map<String, dynamic>?;
//
//             final role = data?['role'] ?? 'user';
//
//             // 🛡️ Admin
//             if (role == 'admin') {
//               return const AdminOrdersPage();
//             }
//
//             // ✅ USER → CartProvider ABOVE ALL ROUTES
//             return ChangeNotifierProvider(
//               create: (_) => CartProvider(),
//               child: const HomePage(),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../pages/loginpage.dart';
// import '../pages/homepage.dart';
// import '../pages/admin_orders_page.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   Future<Widget> _decide() async {
//     final user = FirebaseAuth.instance.currentUser;
//
//     if (user == null) {
//       return const LoginPage();
//     }
//
//     final snap = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .get();
//
//     final data = snap.data();
//     final role = data?['role'] ?? 'user';
//
//     if (role == 'admin') {
//       return const AdminOrdersPage();
//     } else {
//       return const HomePage();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//       future: _decide(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         if (snapshot.hasError) {
//           return const Scaffold(
//             body: Center(child: Text("Something went wrong")),
//           );
//         }
//
//         return snapshot.data!;
//       },
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../pages/loginpage.dart';
// import '../pages/homepage.dart';
// import '../pages/admin_orders_page.dart';
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   Future<Widget> _decide() async {
//     final user = FirebaseAuth.instance.currentUser;
//
//     // 🔴 Not logged in
//     if (user == null) {
//       return const LoginPage();
//     }
//
//     final userRef =
//     FirebaseFirestore.instance.collection('users').doc(user.uid);
//
//     final snap = await userRef.get();
//     final data = snap.data();
//
//     // 🛡️ AUTO-FIX: Firestore doc missing (old users)
//     if (data == null) {
//       await userRef.set({
//         'email': user.email,
//         'role': 'user',
//         'createdAt': Timestamp.now(),
//       });
//
//       return const HomePage();
//     }
//
//     final role = data['role'] ?? 'user';
//
//     // 🔐 Admin
//     if (role == 'admin') {
//       return const AdminOrdersPage();
//     }
//
//     // 👤 Normal user
//     return const HomePage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//       future: _decide(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//
//         if (snapshot.hasError) {
//           return const Scaffold(
//             body: Center(child: Text("Something went wrong")),
//           );
//         }
//
//         return snapshot.data!;
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/loginpage.dart';
import '../pages/homepage.dart';
import '../pages/admin_orders_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // ⏳ Waiting for auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ❌ Not logged in
        if (!snapshot.hasData) {
          return const LoginPage();
        }

        // ✅ Logged in → check role
        final user = snapshot.data!;

        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get(),
          builder: (context, roleSnap) {
            if (roleSnap.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            final data = roleSnap.data?.data() as Map<String, dynamic>?;

            final role = data?['role'] ?? 'user';

            if (role == 'admin') {
              return const AdminOrdersPage();
            } else {
              return const HomePage();
            }
          },
        );
      },
    );
  }
}
