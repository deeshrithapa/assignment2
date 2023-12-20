// import 'package:cloud_firestore/cloud_firestore.dart';
//
// Future<List<Order>> getOrderHistory(String userId) async {
//   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//       .collection('order')
//       .where('userId', isEqualTo: userId)
//       .get();
//
//   List<Order> orderList = querySnapshot.docs.map((doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return Order(
//       orderId: doc.id,
//       productName: data['productName'],
//       price: data['totalPrice'],
//     );
//   }).toList();
//
//   return orderList;
// }
