// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailCtrl = TextEditingController();
//   final _passwordCtrl = TextEditingController();
//   bool _isLoading = false;
//   bool _obscure = true;
//
//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _passwordCtrl.dispose();
//     super.dispose();
//   }
//
//   String? _validateEmail(String? v) {
//     if (v == null || v.trim().isEmpty) return 'Please enter email';
//     final re = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
//     if (!re.hasMatch(v)) return 'Enter a valid email';
//     return null;
//   }
//
//   String? _validatePassword(String? v) {
//     if (v == null || v.trim().isEmpty) return 'Please enter password';
//     if (v.length < 6) return 'Minimum 6 characters';
//     return null;
//   }
//
//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) return;
//     setState(() => _isLoading = true);
//
//     // simulate login delay
//     await Future.delayed(const Duration(milliseconds: 800));
//
//     setState(() => _isLoading = false);
//
//     // On success navigate to home (replace in stack)
//     Navigator.pushReplacementNamed(context, '/home');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Hero(
//                   tag: 'logo',
//                   child: Image.asset(
//                     'assets/images/logo.png',
//                     height: 110,
//                     fit: BoxFit.contain,
//                     errorBuilder: (_, __, ___) => const FlutterLogo(size: 110),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text("Mom's Magic", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 26),
//
//                 Card(
//                   elevation: 6,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: _emailCtrl,
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: const InputDecoration(
//                               labelText: 'Email',
//                               prefixIcon: Icon(Icons.email_outlined),
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: _validateEmail,
//                           ),
//                           const SizedBox(height: 12),
//                           TextFormField(
//                             controller: _passwordCtrl,
//                             obscureText: _obscure,
//                             decoration: InputDecoration(
//                               labelText: 'Password',
//                               prefixIcon: const Icon(Icons.lock_outline),
//                               border: const OutlineInputBorder(),
//                               suffixIcon: IconButton(
//                                 icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
//                                 onPressed: () => setState(() => _obscure = !_obscure),
//                               ),
//                             ),
//                             validator: _validatePassword,
//                           ),
//                           const SizedBox(height: 18),
//                           SizedBox(
//                             width: double.infinity,
//                             height: 48,
//                             child: ElevatedButton(
//                               onPressed: _isLoading ? null : _submit,
//                               child: _isLoading
//                                   ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
//                                   : const Text('Log in', style: TextStyle(fontSize: 16)),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(onPressed: () {}, child: const Text('Forgot password?')),
//                               TextButton(
//                                 onPressed: () {
//                                   // For MVP just show a dialog
//                                   showDialog(
//                                     context: context,
//                                     builder: (c) => AlertDialog(
//                                       title: const Text('Register'),
//                                       content: const Text('Registration not implemented in MVP.\nUse "Use demo account" or implement signup later.'),
//                                       actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('OK'))],
//                                     ),
//                                   );
//                                 },
//                                 child: const Text('Register'),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 14),
//                 TextButton.icon(
//                   onPressed: () {
//                     // quick demo credentials
//                     _emailCtrl.text = 'demo@mom.com';
//                     _passwordCtrl.text = 'demopass';
//                     _submit();
//                   },
//                   icon: const Icon(Icons.login),
//                   label: const Text('Use demo account'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




//
//
// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
//
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // 🔹 Controllers banaye
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.pink[200],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20), // thoda spacing
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/images/logo.png", height: 120),
//               const SizedBox(height: 20),
//               const Text("Welcome to Mom's Magic",
//                   style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 30),
//
//               // 🔹 Username field
//               TextField(
//                 controller: usernameController,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//
//               // 🔹 Password field
//               TextField(
//                 controller: passwordController,
//                 obscureText: true, // password hide hoga
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//
//               // 🔹 Login Button
//               ElevatedButton(
//                 // onPressed: () {
//                 //   String user = usernameController.text;
//                 //   String pass = passwordController.text;
//                 //
//                 //   if (user == "admin" && pass == "1234") {
//                 //     Navigator.pushReplacementNamed(context, '/home');
//                 //   } else {
//                 //     ScaffoldMessenger.of(context).showSnackBar(
//                 //       const SnackBar(content: Text("Invalid credentials!")),
//                 //     );
//                 //   }
//                 // },
//                 onPressed: () async {
//                   final authService = AuthService();
//
//                   final user = await authService.loginWithEmail(
//                     emailController.text.trim(),
//                     passwordController.text.trim(),
//                   );
//
//                   if (user != null) {
//                     Navigator.pushReplacementNamed(context, '/home');
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Login failed")),
//                     );
//                   }
//                 },
//
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.black,
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text("Login"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // 🔹 Controllers
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//
//     final AuthService authService = AuthService();
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.pink[200],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/images/logo.png", height: 120),
//               const SizedBox(height: 20),
//
//               const Text(
//                 "Welcome to Mom's Magic",
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),
//
//               const SizedBox(height: 30),
//
//               // 🔹 Email field
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               // 🔹 Password field
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               // 🔹 LOGIN BUTTON (Firebase)
//               ElevatedButton(
//                 onPressed: () async {
//                   final user = await authService.loginWithEmail(
//                     emailController.text.trim(),
//                     passwordController.text.trim(),
//                   );
//
//                   if (user != null) {
//                     Navigator.pushReplacementNamed(context, '/home');
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Login failed")),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 30, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text("Login"),
//               ),
//
//               const SizedBox(height: 10),
//
//               // 🔹 SIGNUP BUTTON
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/signup');
//                 },
//                 child: const Text(
//                   "Don’t have an account? Sign up",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: Colors.pink[200],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/images/logo.png", height: 120),
//               const SizedBox(height: 20),
//
//               const Text(
//                 "Welcome to Mom's Magic",
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),
//
//               const SizedBox(height: 30),
//
//               // Email
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               // Password
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               // 🔐 LOGIN
//               ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     await FirebaseAuth.instance.signInWithEmailAndPassword(
//                       email: emailController.text.trim(),
//                       password: passwordController.text.trim(),
//                     );
//
//                     Navigator.pushReplacementNamed(context, '/home');
//                   } catch (e) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text(e.toString())),
//                     );
//                   }
//                 },
//                 child: const Text("Login"),
//               ),
//
//               const SizedBox(height: 10),
//
//               // 🆕 SIGN UP (sirf navigation)
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/signup');
//                 },
//                 child: const Text(
//                   "New user? Sign up",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: Colors.pink[200],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/images/logo.png", height: 120),
//               const SizedBox(height: 20),
//
//               const Text(
//                 "Welcome to Mom's Magic",
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),
//
//               const SizedBox(height: 30),
//
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               // 🔐 LOGIN (NO REDIRECT HERE)
//               ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     await FirebaseAuth.instance.signInWithEmailAndPassword(
//                       email: emailController.text.trim(),
//                       password: passwordController.text.trim(),
//                     );
//                     // ✅ RoleGate will handle redirect
//                   } catch (e) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text(e.toString())),
//                     );
//                   }
//                 },
//                 child: const Text("Login"),
//               ),
//
//               const SizedBox(height: 10),
//
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/signup');
//                 },
//                 child: const Text(
//                   "New user? Sign up",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", height: 120),
              const SizedBox(height: 20),

              const Text(
                "Welcome to Mom's Magic",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // 🔐 LOGIN (AuthGate will redirect)
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  if (_isLoading) return;

                  setState(() => _isLoading = true);

                  try {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    // ❌ NO navigation here
                    // ✅ AuthGate handles redirect
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  } finally {
                    if (mounted) {
                      setState(() => _isLoading = false);
                    }
                  }
                },
                child: const Text("Login"),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  "New user? Sign up",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
