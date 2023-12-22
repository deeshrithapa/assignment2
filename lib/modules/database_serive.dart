// import 'package:firebase_database/firebase_database.dart';
// import 'User.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class DatabaseService {
//   final DatabaseReference _userRef =
//   FirebaseDatabase.instance.reference().child('users');
//
//   // Get user data from Firebase based on user ID
//   Future<User?> getUserData(String userId) async {
//     try {
//       DataSnapshot snapshot = (await _userRef.child(userId).once()) as DataSnapshot;
//
//       if (snapshot.value != null) {
//         // Ensure that snapshot.value is cast to Map<String, dynamic>
//         Map<String, dynamic>? userData = snapshot.value as Map<String, dynamic>?;
//
//         if (userData != null) {
//           // Assuming User.fromSnapshot is a constructor for your User model
//           return User.fromSnapshot(userId, userData);
//         } else {
//           print('userData is null or not a Map<String, dynamic>.');
//           return null;
//         }
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
