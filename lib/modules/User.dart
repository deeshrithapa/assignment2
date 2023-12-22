// class User {
//   late String userId;
//   late String email;
//   late String displayName;
//   late Map<String, dynamic> cart;
//
//   User({
//     required this.userId,
//     required this.email,
//     required this.displayName,
//     required this.cart,
//   });
//
//   // Factory method to create a User object from Firebase snapshot
//   factory User.fromSnapshot(String userId, Map<dynamic, dynamic> snapshot) {
//     return User(
//       userId: userId,
//       email: snapshot['email'],
//       displayName: snapshot['displayName'],
//       cart: snapshot['cart'] ?? {},
//     );
//   }
// }
