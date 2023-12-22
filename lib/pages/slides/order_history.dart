import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/order.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late Future<List<MyAppOrder>> orderHistoryFuture;

  @override
  void initState() {
    super.initState();
    User? user = _auth.currentUser;
    if (user != null) {
      orderHistoryFuture = _getOrderHistory(user.uid);
    } else {
      // Handle the case where the user is not logged in
      orderHistoryFuture = Future.value([]);
    }
  }

  Future<List<MyAppOrder>> _getOrderHistory(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('order')
          .where('userId', isEqualTo: userId)
          .get();

      List<MyAppOrder> orderHistory = querySnapshot.docs
          .map((doc) => MyAppOrder.fromQueryDocumentSnapshot(doc))
          .toList();

      return orderHistory;
    } catch (error) {
      print('Error retrieving order history: $error');
      // Handle the error if necessary
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: FutureBuilder<List<MyAppOrder>>(
        future: orderHistoryFuture, // The future that resolves to the order history
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the future to complete, display a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If an error occurs, display an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If the future completes successfully
            List<MyAppOrder> orderHistory = snapshot.data!;

            if (orderHistory.isEmpty) {
              // If there is no order history, display a message
              return Center(child: Text('No order history found.'));
            } else {
              // If there is order history, display a ListView
              return ListView.builder(
                itemCount: orderHistory.length,
                itemBuilder: (context, index) {
                  // Build a ListTile for each order in the order history
                  return ListTile(
                    title: Text('Order ID: ${orderHistory[index].orderId}'),
                    subtitle: Text('Product: ${orderHistory[index].product}'),
                    trailing: Text('Price: \$${orderHistory[index].price.toStringAsFixed(2)}'),
                  );
                },
              );
            }
          }
        },
      ),

    );
  }
}
