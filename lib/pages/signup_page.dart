import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/auth_gate.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                try {
                  // 1️⃣ Create user in Firebase Auth
                  final user = await authService.signUpWithEmail(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );

                  if (user != null) {
                    // 2️⃣ Save user in Firestore (🔥 ONLY ADDITION = role)
                    print("🔥 Saving user to Firestore: ${user.uid}");

                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .set({
                      'email': emailController.text.trim(),
                      'role': 'user', // ✅ IMPORTANT (NEW)
                      'createdAt': Timestamp.now(),
                    });

                    print("✅ User saved to Firestore");

                    // 3️⃣ Navigate (UNCHANGED)
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const AuthGate()),
                          (route) => false,
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
