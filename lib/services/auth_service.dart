
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔐 SIGN UP + SAVE TO FIRESTORE
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      // 1️⃣ Create user in Firebase Auth
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;

      // 2️⃣ Save user data in Firestore
      print("🔥 Saving user to Firestore: ${user.uid}");

      await _firestore.collection('users').doc(user.uid).set({
        'email': email,
        'uid': user.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print("✅ User saved to Firestore");

      return user;
    } catch (e) {
      print("❌ Signup Error: $e");
      return null;
    }
  }

  // 🔑 LOGIN
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("❌ Login Error: $e");
      return null;
    }
  }

  // 🚪 LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }
}
