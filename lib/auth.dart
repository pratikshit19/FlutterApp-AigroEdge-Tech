import 'package:firebase_auth/firebase_auth.dart';

/*class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}*/

class Auth {
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Use Firebase Authentication or any other authentication mechanism
      // to sign in the user with the provided email and password.
      // Example with Firebase Authentication:
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: avoid_print
      print('User signed in successfully!');
    } catch (e) {
      // ignore: avoid_print
      print('Sign in error: $e');
    }
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Use Firebase Authentication or any other authentication mechanism
      // to register the user with the provided email and password.
      // Example with Firebase Authentication:
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: avoid_print
      print('User registered successfully!');
    } catch (e) {
      // ignore: avoid_print
      print('Registration error: $e');
    }
  }
}
