// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
//
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   // Sign in with email and password
//   Future<User?> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       User? user = result.user;
//
//       return user;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   // Listen for changes in user authentication state
//   Stream<User?> get authStateChanges => _auth.authStateChanges();
// }
//
//
